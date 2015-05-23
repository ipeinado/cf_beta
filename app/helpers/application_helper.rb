module ApplicationHelper

  def current_controller?(controller)
    params[:controller] == controller ? "active" : ""
  end

end
