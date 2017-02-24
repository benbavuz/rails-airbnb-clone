# lawyer_mailer.rb

class LawyerMailer < ApplicationMailer
  def confirmation(lawyer)
    @lawyer = lawyer

    mail(
      to:       @lawyer.user.email,
      subject:  "Congratulation ! Your listing #{@lawyer.user.first_name} is created!"
    )
  end
end
