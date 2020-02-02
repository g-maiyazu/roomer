class CustomMailer < ApplicationMailer
  default from: 'roomer.work <noreply@roomer.work>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.custom_mailer.test.subject
  #
  def test
    @greeting = 'Hi'

    mail to: ENV['GMAIL_ADDRESS']
  end
end
