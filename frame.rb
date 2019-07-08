class Frame
    attr_accessor :number, :scores, :bonus

    def initialize(number)
        @number = number + 1
        @scores = []
    end

    def add(score)
        raise "Score #{score} is not in valid range" unless score.to_i.between?(0, 10)
        @scores << score
    end

    def eql?(other)
        @number ==  other.number
    end

    def hash
        @number.hash
    end
end
