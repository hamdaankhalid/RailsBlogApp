# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internal::LinkedinClientService do
  it 'works' do
    client = Internal::LinkedinClientService.new('fake')
    response = client.share_article(2,
                                    'TEST', 'www.google.com')
    puts response
  end
end
