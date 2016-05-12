class MessagesController < ApplicationController
  def manifest_support
    @message = ManifestSupportMessage.new
  end

  def create_manifest_support
    @message = ManifestSupportMessage.new(message_params)

    if @message.valid?
      flash[:success] = I18n.t(:thanks_for_supporting)
      redirect_to manifiesto_path 
    else
      render :manifest_support
    end
  end

  private

  def message_params
    params.require(:manifest_support_message).permit(:name, :email, :twitter, :website)
  end
end
