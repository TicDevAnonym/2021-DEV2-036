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
    var state = GameState.playing

    func makeMove(at index: Int) -> GameState {
        // Invalid move
        if board[index] != TicTacToe.empty {
            return .invalidMove
        }
        // Move
        board[index] = activePlayer.sign
        
        // Win
        for winningBoard in TicTacToe.winningBoards {
            if board[winningBoard[0]] != TicTacToe.empty && board[winningBoard[0]] == board[winningBoard[1]] && board[winningBoard[0]] == board[winningBoard[2]] {
                if board[winningBoard[0]] == Player.X.sign {
                    print("X wins")
                    return .win(Player.X)
                } else {
                    print("O wins")
                    return .win(Player.O)
                }
            }
        }
        
     
        activePlayer = activePlayer == Player.X ? Player.O : Player.X
        return .playing
    }
    
    func reset() {
        board.removeAll()
    }
}
