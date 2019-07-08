class Score
  attr_accessor :frames

  def initialize(frames)
    @frames = frames

    # Calculate bonus by player frame
    calculate_bonus_by_player_frame
  end

  # Calculates the corresponding bonus for each player frame
  # @param
  # @return
  def calculate_bonus_by_player_frame
    @frames.each do |player, frames_by_player|
      frames_by_player.each_with_index do |frame, index|
        next if frames_by_player.last.eql? frame

        # Verify if the first score is a strike
        if is_strike? frame.scores.first
          frame.bonus = get_bonus_from_strike(frames_by_player, index)
          next
        end

        if frame.scores.first(2).inject(0) { |sum, score| sum + score.to_i } == 10
          frame.bonus = frames_by_player[index + 1].scores.first.to_i
        end
      end
    end
  end

  # Calculates a score is a strike
  # @param - score(Integer)
  # @return - Boolean
  def is_strike?(score)
    score.to_i == 10
  end

  # Calculates the bonus from a strike
  # @param - frames_by_player([Frame])
  # @param - index(Integer)
  # @return - Integer
  def get_bonus_from_strike(frames_by_player, index)
    if frames_by_player[index + 1].scores.length >= 2
      frames_by_player[index + 1].scores.first(2).inject(0) {|sum, score| sum + score.to_i }
    else
      frames_by_player[index + 1].scores.first.to_i + frames_by_player[index + 2].scores.first.to_i
    end
  end

  # Prints in tab format the score frame by frame for each player
  # @param
  # @return
  def print_score
    # Print frame headers
    print_frame_headers

    @frames.each do |player, frames_by_player|
      puts("#{player.name}")

      # LOL, didn't find another way to store the total score by frame, XD
      summarize_scores = []

      frames_by_player.each_with_index do |frame, index|
        total_score = 0

        print("Pinfalls") if index == 0
        print("\t")

        frame.scores.each do |score|
          total_score += score.to_i

          if is_strike?(score)
            print("X ")
          elsif total_score == 10
            print("/ ")
          else
            print("#{score} ")
          end
        end

        summarize_scores << calculate_total_score(frame, index) + frame.bonus.to_i
      end

      print("\nScore\t\t")

      summarize_scores.inject(0) do |sum, score|
        print("#{sum + score}\t")
        sum + score
      end

      puts("")
    end
  end

  # Prints the frame headers
  # @param
  # @return
  def print_frame_headers
    @frames.each do |player, frames_by_player|
      print("Frame\t\t")

      frames_by_player.each do |frame|
        print("#{frame.number}\t")
      end

      puts("")

      break
    end
  end

  # Calculates the total score by frame
  # @param - frame(Frame)
  # @param - index(Integer)
  # @return - Integer
  def calculate_total_score(frame, index)
    if index < 9
      frame.scores.first(2).inject(0) {|sum, score| sum + score.to_i }
    else
      frame.scores.inject(0) {|sum, score| sum + score.to_i }
    end
  end
end
