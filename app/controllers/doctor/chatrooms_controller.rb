class Doctor::ChatroomsController < ApplicationController
  include ChatroomsControllerConcern

  before_action :authenticate_doctor!, raise: false

  before_action :set_chatroom, only: [:show]

  def show
    @patient = @chatroom.patient
    super(@patient)
  end

  private

  def set_chatroom
    @chatroom = current_doctor.chatrooms.find(params[:id])
  end

end
