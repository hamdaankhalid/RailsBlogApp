# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'internal/linkedin_schedulers/show', type: :view do
  before(:each) do
    @internal_linkedin_scheduler = assign(:internal_linkedin_scheduler, Internal::LinkedinScheduler.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
