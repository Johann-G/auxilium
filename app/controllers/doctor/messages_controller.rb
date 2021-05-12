class Doctor::MessagesController < ApplicationController
  include MessagesControllerConcern

  before_action :authenticate_doctor!, raise: false

  before_action :set_chatroom, only: [:create]

  def create
    resource = current_doctor
    path = doctor_chatroom_path(@chatroom)
    super(resource, path)
  end

  private

  def set_chatroom
    @chatroom = current_doctor.chatrooms.find(params[:chatroom_id])
  end
end
