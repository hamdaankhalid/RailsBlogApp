# frozen_string_literal: true

module Public
  class ProjectsController < ApplicationController
    def index
      @personal_projects = PersonalProject.all.order(created_at: :desc)
    end
  end
end
