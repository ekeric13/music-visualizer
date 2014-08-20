get '/' do
  erb :index
end

post "/songs" do
  @song = params[:uri]
  erb :songs
  track = `spotify-to-mp3 #{song}`
  music-visualizer/app/controllers/views/songs.erb
end

