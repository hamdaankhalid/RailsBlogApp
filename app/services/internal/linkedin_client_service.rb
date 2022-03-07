# frozen_string_literal: true

module Internal
  class LinkedinClientService
    def initialize(token)
      @api_token = token
    end

    def share_article(_article_title, _post_body, _content_url)
      response = http.start do |t|
        t.request(request)
      end

      case response
      when Net::HTTPSuccess
        response
      else
        raise "Linkedin Post Job failed #{response.code}, #{response.body}"
      end
    end

    private

    def request
      request = Net::HTTP::Post.new(share_endpoint_uri.path)
      request.body = json_params(content_url, article_title, post_body)
      request['Authorization'] = "Bearer #{@api_token}"
      request['Content-Type'] = 'application/json'
      request
    end

    def http(uri)
      http = Net::HTTP.new(uri.hostname, uri.port)
      http.use_ssl = true
      http.read_timeout = 160
      http.continue_timeout = 160
      http.ssl_timeout = 160
      http
    end

    def share_endpoint_uri
      URI('https://api.linkedin.com/v2/shares')
    end

    def json_params(content_url, article_title, post_body)
      { content: { contentEntities: [{ entityLocation: content_url }], title: article_title },
        distribution: { linkedInDistributionTarget: {} },
        owner: 'urn:li:person:R5Cg3cbs4v',
        subject: article_title,
        text: { text: post_body } }.to_json
    end
  end
end
