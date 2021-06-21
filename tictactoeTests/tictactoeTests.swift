//
//  tictactoeTests.swift
//  tictactoeTests
//
//  Created by İbrahim Oktay on 19.06.2021.
//

import XCTest
@testable import tictactoe

class tictactoeTests: XCTestCase {
    
    func testGameWinningBoards() {
        let winningBoards = [[0,1,2], [3,4,5], [6,7,8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        XCTAssertEqual(winningBoards, TicTacToe.winningBoards)
    }
    
    func testGameDefaultMove() {
        let move = ""
        XCTAssertEqual(move, TicTacToe.empty)
    }
    
    func testFirstActivePlayer() {
        let game = TicTacToe()
        XCTAssertEqual(Player.X, game.activePlayer)
    }
    
    func testInitialGameState() {
        let game = TicTacToe()
        XCTAssertEqual(GameState.playing, game.state)
    }
    
    func testMakeMove() {
        let game = TicTacToe()
        game.makeMove(at: 0)
        game.makeMove(at: 4)
        game.makeMove(at: 7)
        XCTAssertEqual(Player.X.sign, game.board[0])
        XCTAssertEqual(Player.O.sign, game.board[4])
        XCTAssertEqual(Player.X.sign, game.board[7])
    }
    
    func testResetGame() {
        let game = TicTacToe()
        game.makeMove(at: 0)
        game.makeMove(at: 4)
        
        XCTAssertEqual(Player.X.sign, game.board[0])
        XCTAssertEqual(Player.O.sign, game.board[4])
        
        game.reset()
        XCTAssertTrue(game.board.filter{ $0 == TicTacToe.empty }.count == game.board.count)
    }
    
    func testNextPlayer() {
        let game = TicTacToe()
        XCTAssertEqual(Player.X, game.activePlayer)
        
        game.makeMove(at: 4)
        XCTAssertEqual(Player.X.sign, game.board[4])

        XCTAssertEqual(Player.O, game.activePlayer)
    }
    
    func testInvalidMove() {
        let game = TicTacToe()
        game.makeMove(at: 0)
        let firstState = game.makeMove(at: 0)
        XCTAssertEqual(firstState, GameState.invalidMove)
        
        let secondState = game.makeMove(at: -1)
        XCTAssertEqual(secondState, GameState.invalidMove)

        let thirdState = game.makeMove(at: 10)
        XCTAssertEqual(thirdState, GameState.invalidMove)
        XCTAssertTrue(game.board[0] == Player.X.sign)
    }
    
    func testPlayerXHasWon() {
        let game = TicTacToe()
        game.makeMove(at: 0) //X
        game.makeMove(at: 4) //O
        game.makeMove(at: 1) //X
        game.makeMove(at: 5) //O
        let state = game.makeMove(at: 2) //X

        XCTAssertEqual(state, GameState.win(Player.X))
    }
    
    func testPlayerOHasWon() {
        let game = TicTacToe()
        game.makeMove(at: 0) //X
        game.makeMove(at: 3) //O
        game.makeMove(at: 1) //X
        game.makeMove(at: 4) //O
        game.makeMove(at: 8) //X
        let state = game.makeMove(at: 5) //O

        XCTAssertEqual(state, GameState.win(Player.O))
    }
    
    func testDraw() {
        let game = TicTacToe()
        game.makeMove(at: 1) //X
        game.makeMove(at: 2) //O
        game.makeMove(at: 3) //X
        game.makeMove(at: 4) //O
        game.makeMove(at: 5) //X
        game.makeMove(at: 7) //O
        game.makeMove(at: 6) //X
        game.makeMove(at: 0) //O
        let state = game.makeMove(at: 8) //X

        XCTAssertEqual(state, GameState.draw)

    }
}
