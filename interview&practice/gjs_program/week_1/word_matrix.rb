# Given a 2D board and a word, find if the word exists in the grid.
#
# The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
#
# For example,
# Given board =
#
# [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
# word = "ABCCED", -> returns true,
# word = "SEE", -> returns true,
# word = "ABCB", -> returns false.
require 'byebug'

def exist(board, word)
    row = 0
    result = false
    while row < board.length
        column = 0
        while column < board[row].length
            if board[row][column] == word[0]
                curr_board = Marshal.load(Marshal.dump(board))
                result = true if checker(curr_board,row,column,word) == true
            end
            column += 1
        end

        row += 1
    end

    result
end

def checker(board,row,column,word)
    board[row][column] = "."
    return true if word.length == 1
    word = word[1..-1]
    result = false

    if row > 0 && board[row - 1][column] == word[0]
    # north
          curr_board = Marshal.load(Marshal.dump(board))
        result = true if checker(curr_board,row - 1, column, word) == true
    end

    if row < board.length - 1 && board[row + 1][column] == word[0]
    # south
        curr_board = Marshal.load(Marshal.dump(board))
        result = true if checker(curr_board,row + 1, column, word) == true
    end
    # byebug
    if column > 0 && board[row][column - 1] == word[0]
    # west
        curr_board = Marshal.load(Marshal.dump(board))
         result = true if checker(curr_board,row, column - 1, word) == true
     end

    if column < board[row].length - 1 && board[row][column + 1] == word[0]
        curr_board = Marshal.load(Marshal.dump(board))
         result = true if checker(curr_board,row, column + 1, word) == true
    # east
    end
    result
end


# matrix = [
#   ['A','B','C','E'],
#   ['S','F','C','S'],
#   ['A','D','E','E']
# ]
# puts exist(matrix,"ABCCED") # -> should return true,
# puts exist(matrix,"SEE") # -> should return true,
# puts exist(matrix,"ABCB") # -> should return false.
#
# puts exist([['a','a']],'aaa')
# puts exist([["C","A","A"],["A","A","A"],["B","C","D"]],"AAB")
# puts exist([["C","A","A"]],"AA")
# puts exist([["C","A","A"],["A","A","A"],["B","C","D"]],"AB")


# [["A","B","C","E"]
# ["S","F","E","S"]
# ["A","D","E","E"]]
# "ABCESEEEFS"

puts exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]],"ABCESEEE")
