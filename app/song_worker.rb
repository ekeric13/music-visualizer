class HardWorker
  include Sidekiq::Worker

  def perform(song, track)
    p song
    file = `echo #{song} | spotify-to-mp3`
    FileUtils.mv(file, "../../public/sounds/#{track}") # move file to public/sounds
  end

end
