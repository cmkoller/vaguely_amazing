class ContactMessagesController < ApplicationController
  def new
    @message = ContactMessage.new
  end

  def create
    @message = ContactMessage.new(contact_message_params)
    if @message.save
      ContactMessageMailer.new_message(@message).deliver_later
      flash[:success] = "Thank you! Your message has been delivered!"
      redirect_to root_path
    else
      flash[:error] = @message.errors.full_messages.join(".  ")
      render :new
    end
  end

  protected

  def contact_message_params
    params.require(:contact_message).permit(:email, :body)
  end
end
