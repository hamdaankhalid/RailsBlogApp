class Public::ProjectsController < ApplicationController
  def index
    @personal_projects = PersonalProject.all.order(created_at: :desc)
  end
end
