require "hackerrankit/version"
require "hackerrankit/problem"
require "hackerrankit/problem_parser"
require "hackerrankit/command_line"
require "hackerrankit/file_generator"

module Hackerrankit
  def self.root
    File.dirname __dir__
  end

  def self.test
    File.join root, "test"
  end

  def self.main
    args = Hackerrankit::Commandline.new.parse
    if args
      Hackerrankit::FileGenerator.new.generate(args)
    else
      puts "Doing nothing. Abort!"
    end
  end
end
