class ContactMailer < ActionMailer::Base




  default to: 'instructor@upskillcourse.com'

  def contact_mailer(name, email, body)

    @name = name
    @email = email
    @body = body

    mail(from: email, subject: 'Contact Form Message')

  end

end
