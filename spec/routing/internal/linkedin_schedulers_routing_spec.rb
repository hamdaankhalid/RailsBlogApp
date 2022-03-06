# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Internal::LinkedinSchedulersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/internal/linkedin_schedulers').to route_to('internal/linkedin_schedulers#index')
    end

    it 'routes to #new' do
      expect(get: '/internal/linkedin_schedulers/new').to route_to('internal/linkedin_schedulers#new')
    end

    it 'routes to #edit' do
      expect(get: '/internal/linkedin_schedulers/1/edit').to route_to('internal/linkedin_schedulers#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/internal/linkedin_schedulers').to route_to('internal/linkedin_schedulers#create')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/internal/linkedin_schedulers/1').to route_to('internal/linkedin_schedulers#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/internal/linkedin_schedulers/1').to route_to('internal/linkedin_schedulers#destroy', id: '1')
    end
  end
end
