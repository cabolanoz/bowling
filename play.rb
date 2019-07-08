# Require helper class
load 'helper.rb'
load 'score.rb'

# Verify whether there's any file as argument
if ARGV.length != 1
    p 'No file specified'
    exit
end

# Get filename
filename = ARGV[0]

# Initialize helper class
helper = Helper.new(filename)

# Verify if the file exists
unless helper.file_exists?
    p 'The input file does not exist'
    exit
end

# Grabs frames from play method in helper
frames = helper.play

# Verify if there was any frame build from the file
unless frames.length.positive?
    p 'No gameplay specified in file'
    exit
end

# Print the result
score = Score.new(frames)

# Print score
score.print_score
