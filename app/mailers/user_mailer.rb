class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  def receipt(order)
    mail(to: 'name@example.com', subject: "Receipt for order ##{order.id} from Jungle.com")
  end
end
