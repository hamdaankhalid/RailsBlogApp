class Api::V1::QuehoraesController < ApplicationController
  def index
    @now = Time.now.to_i
  end
end
