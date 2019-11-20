class ContactsController < ApplicationController
  before_action :authenticate_user!


  def index
    @mail = Mail.new
  end

  def send_mail
    @mail = Mail.new(mail_params)
    @mail.user = current_user

    if @mail.save
      redirect_to home_index_path, notice: 'Your mail was sent successfully.'
    else
      render :index, alert: 'Message was not sent'
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def mail_params
    params.require(:mail).permit(:name, :email, :telephone, :title, :message)
  end
end
