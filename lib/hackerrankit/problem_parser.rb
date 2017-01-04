require 'net/http'
require 'json'
require 'uri'
require 'nokogiri'

module Hackerrankit
  class ProblemParser
    def parse(url)
      uri = URI(get_problem_info_url(url))
      problem_info = nil
      Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        problem_info = response.body
      end
      @problem_json = JSON.parse(problem_info)
      Problem.new(
        url,
        get_problem_name_from_json,
        get_problem_sample_input_from_json,
        get_problem_sample_output_from_json)
    end

    private
    def get_problem_name_from_json
      return @problem_json['model']['slug']
    end

    def get_problem_sample_input_from_json
      doc.css("div.challenge_sample_input_body code").text
    end

    def get_problem_sample_output_from_json
      doc.css("div.challenge_sample_output_body code").text
    end

    def get_problem_slug(url)
      uri = URI(url)
      uri.path.split('/').last
    end

    def get_problem_info_url(url)
      "https://www.hackerrank.com/rest/contests/master/challenges/#{get_problem_slug(url)}"
    end

    def doc
      @doc ||= Nokogiri::HTML(
        @problem_json['model']['body_html'].force_encoding('UTF-8')
      )
    end
  end
end
