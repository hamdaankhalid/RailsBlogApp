# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'internal/linkedin_schedulers/new', type: :view do
  before(:each) do
    assign(:internal_linkedin_scheduler, Internal::LinkedinScheduler.new)
  end

  it 'renders new internal_linkedin_scheduler form' do
    render

    assert_select 'form[action=?][method=?]', internal_linkedin_schedulers_path, 'post' do
    end
  end
end
