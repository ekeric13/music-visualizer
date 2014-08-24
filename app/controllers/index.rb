require 'sidekiq'
require 'spotify_to_mp3/spotify'
require 'fileutils'
require_relative '../workers/song_worker.rb'


get '/' do
  erb :index
end



post "/songs" do

  @song = params[:uri]
  artist = params[:artist]
  song_title = params[:song]
  file = `echo #{@song} | spotify-to-mp3`
  track = "#{artist} - #{song_title}.mp3"

  FileUtils.mv(track, "public/sounds")
  HardWorker.perform_async(@song)
end


delete "/deletesong" do
  song = params[:uri]
  artist = params[:artist]
  song_title = params[:song]
  track = "#{artist} - #{song_title}.mp3"
  FileUtils.pwd
  FileUtils.rm("public/sounds/#{track}")

end

