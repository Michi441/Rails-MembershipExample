class PagesController < ApplicationController


  ## CREATE A SITE FOR THE PAGES CONTROLLER - CALLED "HOME".
  def home
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end

  def about
  end

end
