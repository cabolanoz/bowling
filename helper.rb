require 'set'

load 'frame.rb'
load 'player.rb'

class Helper
  attr_accessor :filename

  # Specify the accepted extensions for the file
  ACCEPTED_FILE_EXTENSIONS = ['.txt']

  def initialize(filename)
    @filename = filename
  end

  # Verifies whether the file exists
  # @param
  # @return - Boolean
  def file_exists?
    File.exists?(@filename)
  end

  # Verifies whether the file has a valid extension
  # @param
  # @return - Boolean
  def file_has_valid_extension?
    file_extension = File.extname(@filename)
    ACCEPTED_FILE_EXTENSIONS.include? file_extension
  end

  # Creates a hash of frames by players
  # @param
  # @return - Hash
  def play
    frames = {}

    # Keep track of the last player
    last_player = nil

    # Iterate each line from the file
    File.open(@filename).each do |line|
      # Assign new player
      player = Player.new(line.split(' ').first)

      # Assign empty array if player frame is nil
      frames[player] = [] if frames[player].nil?

      # Get score
      score = line.split(' ').last

      # Verify whether last player is not equal to current player
      unless last_player.eql? player
        # Assign the last frame number to each player
        frames[player] << Frame.new(frames[player].last.number || 0) unless frames[player].last.nil?

        # Assign frame 0 if player has no frame
        frames[player] << Frame.new(0) if frames[player].last.nil?
      end

      # Add score to player frame
      frames[player].last.add(score)

      # Assign last player to current player
      last_player = player
    end

    # Return hash of frames
    frames
  end
end
