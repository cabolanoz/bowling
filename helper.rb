class Helper
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

    # Verifies whether the file has a vali extension
    # @param
    # @return - Boolean
    def file_has_valid_extension?
        file_extension = File.extname(@filename)
        ACCEPTED_FILE_EXTENSIONS.include? file_extension
    end

    # Grabs unique players from file
    # @param
    # @return - Array[String]
    def players
        unique_players = []

        # Iterate each line from the file
        File.open(@filename).each do |line|
            # Separate player name from score
            unique_players << line.split(' ').first
        end

        # Clean array with unique elements
        unique_players.uniq.sort!
    end
end