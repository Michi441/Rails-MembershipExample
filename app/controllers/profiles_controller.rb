class ProfilesController < ApplicationController


  def new
    @profile = Profile.new
  end

  def create
    ## find the user
    @user = User.find(params[:user_id])

    @profile = @user.build_profile(profile_params)

    if @profile.save
      flash[:success] =  "Profile saved!"
      redirect_to root_path
    else
      render action :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @profile = @user.profile
  end

  def update

    @user = User.find(params[:user_id])
    @profile = @user.profile
    if @profile.update_attributes(profile_params)
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id])
    else
      render action :edit
    end
  end




  private

    def profile_params
      params.require(:profile).permit(:username, :first_name, :last_name, :favourite_technologie, :contact_email, :description, :avatar)
    end
end
