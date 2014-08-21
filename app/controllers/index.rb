
require 'spotify_to_mp3/spotify'
require 'sidekiq'
require_relative '../song_worker.rb'


get '/' do
  erb :index
end



post "/songs" do
  # @spotify = SpotifyToMp3::Spotify.new
  # track = @spotify.get_track(params[:uri])
  # p track
  @song = params[:uri]
  artist = params[:artist]
  song_title = params[:song]
  p @song # put @song into an empty file
  track = "#{artist} - #{song_title}.mp3"
  HardWorker.perform_async(@song, track)

  # erb :songs
  # content_type :json
  # track = "/Users/erickennedy/Desktop/music-visualizer/app/views/songs.erb"
  # track.to_json
  # music-visualizer/app/controllers/views/songs.erb
end

