class ChangeMailToSentMail < ActiveRecord::Migration[5.2]
  def change
    rename_table :mails, :sent_mails
  end
end
