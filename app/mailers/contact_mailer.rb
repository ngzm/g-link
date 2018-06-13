# Send Contact Mail
class ContactMailer < ApplicationMailer
  WEBMASTER = 'webmaster@freegame.jpn.org'.freeze
  SUBJECT = 'freegame.linkへのお問い合わせを承りました'.freeze
  default from: WEBMASTER, cc: WEBMASTER

  def contact_mail(contact)
    @name = contact[:name]
    @email = contact[:email]
    @ask = contact[:ask]
    mail to: @email, subject: SUBJECT
  end
end
