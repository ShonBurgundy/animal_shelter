class AnimalsController < ApplicationController

  def index
    @animals = {"Dog: Lily": "Cat: Timber"}
    json_response(@animals)
  end

  private
    def json_response(object, status = :ok)
      render json: object, status: status
    end

end    