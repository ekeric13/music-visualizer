require 'sidekiq'
require 'spotify_to_mp3/spotify'
require 'fileutils'
require_relative '../workers/song_worker.rb'


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
   # put @song into an empty file
  p artist
  file = `echo #{@song} | spotify-to-mp3`
  track = "#{artist} - #{song_title}.mp3"
  p track
  FileUtils.mv(track, "public/sounds")
  HardWorker.perform_async(@song)
  # erb :songs
  # content_type :json
  # track = "/Users/erickennedy/Desktop/music-visualizer/app/views/songs.erb"
  # track.to_json
  # music-visualizer/app/controllers/views/songs.erb
end


delete "/deletesong" do
  song = params[:uri]
  artist = params[:artist]
  song_title = params[:song]
  track = "#{artist} - #{song_title}.mp3"
  p "delete track"
  p track
  FileUtils.pwd
  FileUtils.rm("public/sounds/#{track}")

end

