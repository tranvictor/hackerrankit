require 'test_helper'

class ProblemParser < Minitest::Test
  def test_parse_to_return_a_problem_instance_on_valid_url
    parser = Hackerrankit::ProblemParser.new
    sample_url = "https://www.hackerrank.com/challenges/jumping-on-the-clouds-revisited"
    problem = parser.parse(sample_url)
    assert problem != nil
  end

  def test_parse_can_get_sample_inout_put_even_they_arenot_in_div
    parser = Hackerrankit::ProblemParser.new
    sample_url = "https://www.hackerrank.com/challenges/encryption"
    problem = parser.parse(sample_url)
    assert problem.sample_input.strip.size > 0
    assert problem.sample_output.strip.size > 0
  end

  def test_parse_with_another_test_case
    parser = Hackerrankit::ProblemParser.new
    sample_url = "https://www.hackerrank.com/challenges/minimum-distances"
    problem = parser.parse(sample_url)
    assert problem.sample_input.strip.size > 0
    assert problem.sample_output.strip.size > 0
  end

  def test_parse_with_another_test_case_2
    parser = Hackerrankit::ProblemParser.new
    sample_url = "https://www.hackerrank.com/challenges/kaprekar-numbers"
    problem = parser.parse(sample_url)
    assert problem.sample_input.strip.size > 0
    assert problem.sample_output.strip.size > 0
  end
end
