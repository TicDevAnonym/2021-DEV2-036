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
        if index < 0 || index >= board.count || board[index] != TicTacToe.empty {
            state = .invalidMove
            return state
        }
        // Move
        board[index] = activePlayer.sign
        
        // Win
        for winningBoard in TicTacToe.winningBoards {
            if board[winningBoard[0]] != TicTacToe.empty && board[winningBoard[0]] == board[winningBoard[1]] && board[winningBoard[0]] == board[winningBoard[2]] {
                if board[winningBoard[0]] == Player.X.sign {
                    print("X wins")
                    state = .win(Player.X)
                    return state
                } else {
                    print("O wins")
                    state = .win(Player.O)
                    return state
                }
            }
        }
        let moveCount = board.filter{ $0 != TicTacToe.empty }.count
        if moveCount == board.count {
            state = .draw
            return state
        }
     
        activePlayer = activePlayer == Player.X ? Player.O : Player.X
        state = .playing
        return state
    }
    
    func reset() {
        board.removeAll()
    }
}
