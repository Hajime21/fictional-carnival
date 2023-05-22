class PublicController < ApplicationController
  def home
    @trainings = Training.all.order(data: :desc)
    @users = User.all
  end
end