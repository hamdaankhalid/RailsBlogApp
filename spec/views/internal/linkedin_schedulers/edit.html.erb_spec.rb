# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'internal/linkedin_schedulers/edit', type: :view do
  before(:each) do
    @internal_linkedin_scheduler = assign(:internal_linkedin_scheduler, Internal::LinkedinScheduler.create!)
  end

  it 'renders the edit internal_linkedin_scheduler form' do
    render

    assert_select 'form[action=?][method=?]', internal_linkedin_scheduler_path(@internal_linkedin_scheduler), 'post' do
    end
  end
end
