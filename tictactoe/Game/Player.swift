//
//  Player.swift
//  tictactoe
//
//  Created by İbrahim Oktay on 19.06.2021.
//

import Foundation

enum Player: String {
    case X, O
}

extension Player {
    var sign: String {
        return rawValue
    }
}
