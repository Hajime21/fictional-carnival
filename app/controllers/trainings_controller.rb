class TrainingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trainings = Training.all
  end
  def new
    @training = Training.new
  end

  def create
    @training = current_user.trainings.build(training_params)
    if @training.save
      redirect_to root_path, notice: 'Trening dodany pomyślnie.'
    else
      render :new
    end
  end

  private

  def training_params
    params.require(:training).permit(:liczba_pompek, :data)
  end
end