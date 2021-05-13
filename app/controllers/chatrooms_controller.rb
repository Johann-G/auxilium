class ChatroomsController < ApplicationController
  include ChatroomsControllerConcern

  before_action :authenticate_patient!, raise: false

  before_action :set_chatroom, only: [:show]

  def show
    super(current_patient)
    @doctor = current_patient.doctor
  end

  private

  def set_chatroom
    @chatroom = Chatroom.where(patient: current_patient).find(params[:id])
  end

end