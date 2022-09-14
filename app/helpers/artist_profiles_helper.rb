module ArtistProfilesHelper
  def find_artist_profile
    ArtistProfile.find(params[:id])
  end

  def spotify
    if @artist_profile.spotifyID
      @spotify = RSpotify::Artist.find(@artist_profile.spotifyID)
      @track = @spotify.albums.first.tracks.first.preview_url
    end
  end
end
