require 'test_helper'

class ProblemParser < Minitest::Test
  def test_parse_to_return_a_problem_instance_on_valid_url
    parser = Hackerrankit::ProblemParser.new
    sample_url = "https://www.hackerrank.com/challenges/jumping-on-the-clouds-revisited"
    problem = parser.parse(sample_url)
    assert problem != nil
  end
end
