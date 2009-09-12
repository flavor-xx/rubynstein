class Admin::AdminController < ApplicationController

  before_filter :authorize_admin
end