class PagesController < ApplicationController
  def home
  end

  def display
    @users = User.all
    @messages = Message.all
  end
  
end
