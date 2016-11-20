class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin

  protected

  def check_admin
    redirect_to root_path, alert: "Access denied!" unless current_user.admin?
  end
end
