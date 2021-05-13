class VideoroomsController < ApplicationController
  include VideoroomsControllerConcern

  before_action :authenticate_patient!, raise: false

  before_action :set_videoroom, only: [:show]

  def show
    super(current_patient)
  end

  private

  def set_videoroom
    @videoroom = Videoroom.where(patient: current_patient).find(params[:id])
  end

end