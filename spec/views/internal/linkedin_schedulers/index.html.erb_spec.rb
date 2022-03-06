# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'internal/linkedin_schedulers/index', type: :view do
  before(:each) do
    assign(:internal_linkedin_schedulers, [
             Internal::LinkedinScheduler.create!,
             Internal::LinkedinScheduler.create!
           ])
  end

  it 'renders a list of internal/linkedin_schedulers' do
    render
  end
end
