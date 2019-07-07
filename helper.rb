class Helper
    # Specify the accepted extensions for the file
    ACCEPTED_FILE_EXTENSIONS = ['.txt']

    def initialize(filename)
        @filename = filename
    end

    # Verify whether the file exists
    # @param
    # @return - Boolean
    def file_exists?
        File.exists?(@filename)
    end

    # Verify whether the file has a vali extension
    # @param
    # @return - Boolean
    def file_has_valid_extension?
        file_extension = File.extname(@filename)
        ACCEPTED_FILE_EXTENSIONS.include? file_extension
    end
end