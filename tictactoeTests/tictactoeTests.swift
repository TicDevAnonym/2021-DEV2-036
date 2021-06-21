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
}
