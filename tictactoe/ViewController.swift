//
//  ViewController.swift
//  tictactoe
//
//  Created by İbrahim Oktay on 19.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    var tictactoe: TicTacToe! = TicTacToe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize()  {
        buttons.forEach{ $0.setTitle("", for: .normal) }
    }

    @IBAction func click(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            let player = tictactoe.activePlayer
            sender.setTitle(player.sign, for: .normal)
            tictactoe.makeMove(at: index)
        }
    }
}

