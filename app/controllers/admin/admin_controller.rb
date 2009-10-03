class Admin::AdminController < ApplicationController
  layout 'admin'
  
  before_filter :require_logged_in, :require_admin
end