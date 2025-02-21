class ApplicationController < ActionController::Base
  layout :determine_layout
  before_action :authenticate_user!
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern




  include Pundit::Authorization


  def determine_layout

    unless current_user
      'devise'
    end
  end
end
