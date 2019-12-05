class ContactsController < ApplicationController
  before_action :authenticate_user!


  def index
    @sent_mail = SentMail.new
  end

  def send_mail
    @sent_mail = SentMail.new(mail_params)
    @sent_mail.user = current_user

    puts mail_params.inspect

    if @sent_mail.save
      ContactMailer.contact_email(mail_params[:email], mail_params[:name], mail_params[:telephone], mail_params[:title], mail_params[:message]).deliver_now
      redirect_to home_index_path, notice: I18n.t('controllers.contacts.send_success')
    else
      render :index, alert: I18n.t('controllers.contacts.send_fail')
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def mail_params
    params.require(:sent_mail).permit(:name, :email, :telephone, :title, :message)
  end
end
