//
//  ViewController.swift
//  tictactoe
//
//  Created by İbrahim Oktay on 19.06.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    var tictactoe: TicTacToe! = TicTacToe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize()  {
        playAgainButton.isHidden = true
        resultLabel.isHidden = true
        buttons.forEach{ $0.setTitle("", for: .normal) }
        buttons.forEach{ $0.isEnabled = true }
        tictactoe.reset()
    }

    @IBAction func click(_ sender: UIButton) {
        if let index = buttons.firstIndex(of: sender) {
            let player = tictactoe.activePlayer
            let state = tictactoe.makeMove(at: index)
            
            switch state {
            case .invalidMove:
                showWarning()
            case .playing:
                sender.setTitle(player.sign, for: .normal)
                resultLabel.isHidden = true
            case .win(let player):
                sender.setTitle(player.sign, for: .normal)
                show(winning: player)
            case .draw:
                sender.setTitle(player.sign, for: .normal)
                setDraw()
            }
        }
    }
    
    private func showWarning() {
        resultLabel.text = "Invalid move..."
        resultLabel.isHidden = false
    }
    
    private func setDraw() {
        resultLabel.text = "It's a draw"
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
        buttons.forEach{ $0.isEnabled = false }
    }
    
    private func show(winning player: Player) {
        resultLabel.text = "Player \(player.sign) has won!!!"
        resultLabel.isHidden = false
        playAgainButton.isHidden = false
        buttons.forEach{ $0.isEnabled = false }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        initialize()
    }
}

