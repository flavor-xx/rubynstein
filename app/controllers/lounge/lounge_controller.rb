class Lounge::LoungeController < ApplicationController
  layout 'lounge'
  
  before_filter :require_logged_in
end