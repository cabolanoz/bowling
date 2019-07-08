# Require helper class
load 'helper.rb'

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

# Print header
p 'Frame        1       2       3       4       5       6       7       8       9       10'

# Grab players from file
players = helper.players

p players