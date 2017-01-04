module Hackerrankit
  class Problem
    attr_accessor :url, :name, :sample_input, :sample_output

    def initialize(url, name, sample_input, sample_output)
      self.url = url
      self.name = name
      self.sample_input = sample_input
      self.sample_output = sample_output
    end
  end
end
