class HardWorker
  include Sidekiq::Worker

  def perform(song)
    file = `echo #{song} | spotify-to-mp3`
    FileUtils.mv(file, "/public/sounds") # move file to public/sounds
  end

end
