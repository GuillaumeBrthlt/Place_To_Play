class VenueProfilesController < ApplicationController
  def index
    @venue_profiles = VenueProfile.all
  end

  def show
    @venue_profile = VenueProfile.find(params[:id])
  end

  def new; end

  def create
    @venue_profile = VenueProfile.new(venue_profile_params)
    @venue_profile.user_id = current_user.id
    @venue_profile.save
    current_user.update(is_venue: true)
    redirect_to artist_profiles_path
  end

  def update
    @venue_profile = VenueProfile.find(params[:id])
  end

  def edit
    @venue_profile = VenueProfile.find(params[:id])
  end

  def destroy
    @venue_profile = VenueProfile.find(params[:id])
    @venue_profile.destroy
    redirect_to root_path
  end

  private

  def venue_profile_params
    params.permit(:name, :description, :type_of_location, :capacity, :address, :zipcode, :city)
  end
end