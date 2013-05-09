class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :exclude_meta_params

  private
  def exclude_meta_params
    params.except!(:action, :controller, :format)
  end
end
