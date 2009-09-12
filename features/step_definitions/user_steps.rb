Given /^I have users with login (.+)$/ do |logins|
  logins.split(',').each do |login|
    #UserSessionController.new(:login => login, :password => 'test')
  end
end
