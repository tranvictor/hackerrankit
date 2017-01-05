require 'fileutils'
require 'hackerrankit/problem_parser'

module Hackerrankit
  class FileGenerator
    def generate(args)
      problem = ProblemParser.new.parse(args[:url])
      language = args[:lang]
      if problem
        puts "Creating problem directory skeleton"
        # create problem directory
        create_directory(problem)
        # create main program file base on language
        create_main_program(problem, language)
        # create sample.input
        create_sample_input(problem)
        # create sample.output
        create_sample_output(problem)
        # create run.sh base on language
        create_runsh(problem, language)
      else
        puts "Couldn't fetch problem information. Please fire an issue on https://github.com/tranvictor/hackerrankit"
      end
    end

    private
    def create_directory(problem)
      puts "\tcreate #{File.join(problem.name, '')}"
      Dir.mkdir(problem.name)
    end

    def create_main_program(problem, language)
      main_file_name = get_main_file_name(language)
      main_file_path = File.join(
        Hackerrankit.root, "template",
        language, main_file_name)
      des_path = File.join(problem.name, main_file_name)
      puts "\tcreate #{des_path}"
      FileUtils.cp(main_file_path, des_path)
    end

    def create_sample_input(problem)
      path = File.join(problem.name, "sample.input")
      if File.exist?(path)
        puts "\tignore #{path}. It already exists."
      else
        open(path, 'w') do |f|
          f.write(problem.sample_input)
        end
        puts "\tcreate #{path}"
      end
    end

    def create_sample_output(problem)
      path = File.join(problem.name, "sample.output")
      if File.exist?(path)
        puts "\tignore #{path}. It already exists."
      else
        open(path, 'w') do |f|
          f.write(problem.sample_output)
        end
        puts "\tcreate #{path}"
      end
    end

    def create_runsh(problem, language)
      runsh_path = File.join(
        Hackerrankit.root, "template", language, "compile.sh")
      des_path = File.join(problem.name, "run.sh")
      puts "\tcreate #{des_path}"
      FileUtils.cp(runsh_path, des_path)
      FileUtils.chmod("a+x", des_path)
    end

    def get_main_file_name(language)
      if language == "C++"
        "main.cpp"
      end
    end
  end
end
