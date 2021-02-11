class Devise::CustomMailer < Devise::Mailer
  helper :application
  include Devise::Controllers::UrlHelpers

  default template_path: 'devise/mailer'
  # default from: ->(*) { Class.instance.email_address }

  def confirmation_instructions(record, token, opts={})
    opts[:subject] = "Tu dois confirmer ton compte Diggerz"
    super
  end
end
