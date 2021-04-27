class WelcomeController < ApplicationController
  def index
    redirect_to families_path
  end
end
