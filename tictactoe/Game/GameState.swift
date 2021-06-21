//
//  GameState.swift
//  tictactoe
//
//  Created by İbrahim Oktay on 21.06.2021.
//

import Foundation

enum GameState: Equatable {
    case win(Player)
    case draw
    case playing
    case invalidMove
}
