class UsersController < ApplicationController
  def search
    @users = User.where('name like ?', "#{ params[:keyword] }%")
    respond_to do |format|
      format.json
    end
  end
end
