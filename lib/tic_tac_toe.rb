class TicTacToe

    def initialize(board = nil)
        @board = board || Array.new(9, " ")
    end

    WIN_COMBINATIONS = [
        [0,1,2], [3,4,5], [6,7,8], 
        [0,3,6], [1,4,7], [2,5,8],
        [0,4,8], [2,4,6]
    ]

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
        index = input.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == " " ? false : true
    end

    def valid_move?(index)
        if index >= 0 and index <= 8
            position_taken?(index) ? false : true            
        else
            false
        end        
    end

    def turn_count
        @board.count{|token| token == "X" || token == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn        
        input = gets.chomp
        index = input_to_index(input)
        #valid_move?(index) == true ? move(index, current_player) : input
        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            input = gets.chomp
        end                      
    end

    def won?
        WIN_COMBINATIONS.each do |winning_line|
            win_index_1 = winning_line[0]
            win_index_2 = winning_line[1]
            win_index_3 = winning_line[2]

            position_1 = @board[win_index_1]
            position_2 = @board[win_index_2]
            position_3 = @board[win_index_3]

            if position_1 == "X" && position_2 == "X" && position_3 == "X"
                return winning_line
            elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
                return winning_line
            end
        end            
        false
    end

    def full?
        @board.include?(" ") ? false : true
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if winning_line = won?
            @board[winning_line[0]]
        end
    end

    def play
        puts "Enter a number (1-9):"
        turn until over?
        # if won?
        #     puts "Congratulations #{winner}!"
        # else
        #     puts "Cat's Game!"
        # end
        puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
    end
    
end
