class TicTacToe
    def initialize()
        @game_state = Array.new(3) { Array.new(3, '') }
        @turn = 'X'
    end

    def print_board(io = $stdout)
        pretty = @game_state.map { |row| row.map { |c| c.nil? || c.strip.empty? ? ' ' : c }.join(' | ') }
        io.puts pretty.join("\n---------\n")
    end

    def mark_square(row, col)
        return false unless (0..2).include?(row) && (0..2).include?(col)
        return false unless @game_state[row][col].to_s.strip.empty?

        @game_state[row][col] = @turn
        @turn = @turn == 'X' ? 'O' : 'X'
        true
    end

    def tictactoe_winner(board)
        n = board.size
        return nil if n == 0

        
        empty = ->(cell) { cell.nil? || cell == '' || cell == ' ' }
        lines = []

        board.each { |row| lines << row }

        (0...n).each { |c| lines << board.map { |r| r[c] } }
        lines << (0...n).map { |i| board[i][i] }
        lines << (0...n).map { |i| board[i][n - 1 - i] }

        lines.each do |line|
            next if line.any? { |cell| empty.call(cell) }
            return line.first if line.uniq.size == 1
        end

        return :draw if board.flatten.none? { |cell| empty.call(cell) }
        nil
    end

    def game_loop(io_in: $stdin, io_out: $stdout)
        loop do
        result = tictactoe_winner(@game_state)
        if result
            print_board(io_out)
            io_out.puts(result == :draw ? "It's a draw!" : "Player #{result} wins!")
            return result
        end

        print_board(io_out)
        io_out.puts "Player #{@turn}, enter your move as 'row col' (0-2), or 'q' to quit:"
        input = io_in.gets
        return :quit if input.nil? || input.strip.downcase == 'q'

        if input.strip =~ /\A(\d)\s*[, ]\s*(\d)\z/ || input.strip =~ /\A(\d)\s+(\d)\z/
            r = $1.to_i
            c = $2.to_i
            if mark_square(r, c)
            next
            else
            io_out.puts "Invalid move (out of bounds or occupied). Try again."
            end
        else
            io_out.puts "Please enter two numbers 0..2, e.g., '1 2'."
        end
        end
    end
end

game = TicTacToe.new

game.game_loop