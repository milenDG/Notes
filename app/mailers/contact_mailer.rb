class ContactMailer < ApplicationMailer

  # Method creating an email and sending it.
  def contact_email(email, name, telephone, title, message)
    @title = title
    @email = email
    @name = name
    @telephone = telephone
    @message = message

    mail cc: @email, subject: title
  end
end