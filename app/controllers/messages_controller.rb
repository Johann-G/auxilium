class MessagesController < ApplicationController
  include MessagesControllerConcern

  before_action :authenticate_patient!, raise: false

  before_action :set_chatroom, only: [:create]

  def create
    resource = current_patient
    path = chatroom_path(@chatroom)
    super(resource, path)
  end

  private

  def set_chatroom
    @chatroom = Chatroom.where(patient: current_patient).find(params[:chatroom_id])
  end
end