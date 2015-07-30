module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def navbar_login?
    devise_controller? && (resource.email == "")
  end

  def navbar_rego?
    devise_controller? && resource.errors.empty?
  end
end
