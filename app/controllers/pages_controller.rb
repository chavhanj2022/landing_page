class PagesController < ApplicationController
  def home
  end

  def not_found
    render status: :not_found
  end
end
