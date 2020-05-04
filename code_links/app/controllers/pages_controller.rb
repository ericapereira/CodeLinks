class PagesController < ApplicationController
  def home
  end

  def display
    @users = User.all
  end

  def forum
  end

  def lessons
  end

  def faq
  end

  def search
    @user = current_user
    @city_options = {}
    if tutor?
      guardians.each { |e|
        @city_options[e.city] = e.city
       }
    else
      tutors.each { |e|
        @city_options[e.city] = e.city

      }
    end
    @something = params[:cities]
  end

end
