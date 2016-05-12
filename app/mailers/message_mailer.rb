class MessageMailer < ApplicationMailer
  default to: 'i.peinado.martinez@gmail.com'

  def support_message(msg)

    @msg = msg

    mail from: @msg.email, subject: "Nuevo apoyo al Manifiesto Closefunding", body: '<ul><li>Nombre: ' + @msg.name + '</li><li>Twitter: ' + @msg.twitter + '</li><li>Página web: ' + @msg.website  + '</li></ul>'
  end
end
