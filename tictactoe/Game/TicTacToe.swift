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
    
    @discardableResult
    func makeMove(at index: Int) -> GameState {
        if let state = checkInvalidMove(index) {
            return state
        }
        // Move
        board[index] = activePlayer.sign
        
        if let state = checkWin() {
            return state
        }
        if let state = checkDraw() {
            return state
        }
        
        activePlayer = nextPlayer()
        state = .playing
        return state
    }
    
    private func checkInvalidMove(_ index: Int) -> GameState? {
        if index < 0 || index >= board.count || board[index] != TicTacToe.empty {
            state = .invalidMove
            return state
        }
        return nil
    }
    
    private func checkWin() -> GameState? {
        for winningBoard in TicTacToe.winningBoards {
            if board[winningBoard[0]] != TicTacToe.empty && board[winningBoard[0]] == board[winningBoard[1]] && board[winningBoard[0]] == board[winningBoard[2]] {
                state = .win(activePlayer)
                return state
            }
        }
        return nil
    }
    
    private func checkDraw() -> GameState? {
        let moveCount = board.filter{ $0 != TicTacToe.empty }.count
        if moveCount == board.count {
            state = .draw
            return state
        }
        return nil
    }
    
    private func nextPlayer() -> Player {
        return activePlayer == Player.X ? Player.O : Player.X
    }
    
    func reset() {
        board.removeAll()
        board = Array(repeating: TicTacToe.empty, count: 9)
        state = .playing
        activePlayer = Player.X
    }
}
