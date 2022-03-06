# frozen_string_literal: true

json.extract! internal_linkedin_scheduler, :id, :created_at, :updated_at
json.url internal_linkedin_scheduler_url(internal_linkedin_scheduler, format: :json)
