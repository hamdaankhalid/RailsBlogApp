module Internal
  class LinkedinClientService
    def initialize
    end

    def share_article(post_body, url)
      puts "Linkedin sent #{post_body}, #{url}"
    end
  end
end