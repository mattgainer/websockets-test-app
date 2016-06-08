class MessagesController < ApplicationController
  def index
    @messages = Message.where('created_at > (?)', Time.now - 30.minutes).order(:created_at)
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    @messages = Message.where('created_at > (?)', Time.now - 30.minutes)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:message, :username)
  end
end
