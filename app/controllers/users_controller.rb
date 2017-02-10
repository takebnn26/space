class UsersController < ApplicationController
  def index
    @users = User.where('name like ?', "#{ params[:keyword] }%")
    respond_to do |format|
      format.json
    end
  end
end
