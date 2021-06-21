//
//  TicTacToe.swift
//  tictactoe
//
//  Created by İbrahim Oktay on 19.06.2021.
//

import Foundation

class TicTacToe {
    static let empty = ""
    static let winningBoards = [[0,1,2], [3,4,5], [6,7,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    var board = Array(repeating: TicTacToe.empty, count: 9)
    var activePlayer: Player = Player.X
    
    func makeMove(at index: Int) {
        // Move
        board[index] = activePlayer.sign
        activePlayer = activePlayer == Player.X ? Player.O : Player.X
    }
    
    func reset() {
        board.removeAll()
    }
}
