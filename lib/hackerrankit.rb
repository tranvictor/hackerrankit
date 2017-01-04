require "hackerrankit/version"
require "hackerrankit/problem"
require "hackerrankit/problem_parser"
# require "hackerrankit/command_line"

module Hackerrankit
  def self.root
    File.dirname __dir__
  end

  def self.test
    File.join root, "test"
  end
end
