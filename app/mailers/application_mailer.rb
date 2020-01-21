class ApplicationMailer < ActionMailer::Base

  default from: 'from@example.com'
  default content_type: 'text/html'

  layout 'mailer'

end
