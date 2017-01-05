module Hackerrankit
  class Commandline
    def parse
      args = [:url, :lang]
      @args = {}
      ARGV.each_with_index do |arg, index|
        @args[args[index]] = arg if index < 2
      end
      if @args[:lang].nil?
        puts "Using default language: C++"
        @args[:lang] = "C++"
      end
      if @args[:url].nil?
        puts "Please specify at least the problem's URL. Example:"
        puts "$ hackerrankit https://www.hackerrank.com/challenges/acm-icpc-team"
        return nil
      end
      if @args.size > 2
        puts "More than 2 parameters specified. Ignored last #{ARGV.size - 2} params."
      end
      unless supported_language? @args[:lang]
        puts "#{@args[:lang]} is not supported yet."
        return nil
      end
      return @args
    end

    private
    def supported_language?(lang)
      ["C++"].include?(lang)
    end
  end
end
