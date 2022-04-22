//
//  ViewController.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    // Player 1
    var scoreP1 = 20
    @IBOutlet weak var p1plus1Button: UIButton!
    @IBOutlet weak var p1plus5button: UIButton!
    @IBOutlet weak var p1minus1button: UIButton!
    @IBOutlet weak var p1minus5button: UIButton!
    @IBOutlet weak var p1score: UILabel!
    
    @IBAction func add1p1(_ sender: Any) {
        scoreP1 += 1
        p1score.text = "\(scoreP1)"
    }
    
    @IBAction func add5p1(_ sender: Any) {
        scoreP1 += 5
        p1score.text = "\(scoreP1)"
    }
    
    @IBAction func sub1p1(_ sender: Any) {
        scoreP1 -= 1
        if(scoreP1 <= 0) {
            scoreP1 = 0
            endGame(2)
        }
        p1score.text = "\(scoreP1)"
    }
    
    @IBAction func sub5p1(_ sender: Any) {
        scoreP1 -= 5
        if(scoreP1 <= 0) {
            scoreP1 = 0
            endGame(2)
        }
        p1score.text = "\(scoreP1)"
    }
    
    // Player 2
    var scoreP2 = 20
    @IBOutlet weak var p2score: UILabel!
    
    @IBAction func plus1p2(_ sender: Any) {
        scoreP2 += 1
        p2score.text = "\(scoreP2)"
    }
    
    @IBAction func plus5p2(_ sender: Any) {
        scoreP2 += 5
        p2score.text = "\(scoreP2)"
    }
    
    
    @IBAction func sub1p2(_ sender: Any) {
        scoreP2 -= 1
        if(scoreP2 <= 0) {
            scoreP2 = 0
            endGame(1)
        }
        p2score.text = "\(scoreP2)"
    }
    
    @IBAction func sub5p2(_ sender: Any) {
        scoreP2 -= 5
        if(scoreP2 <= 0) {
            scoreP2 = 0
            endGame(1)
        }
        p2score.text = "\(scoreP2)"
    }
    
    private func endGame(_ winner: Int) {
        if(winner == 1) {
            winnerLabel.text = "Player 2 LOSES"
            winnerLabel.isHidden = false
        } else {
            winnerLabel.text = "Player 1 LOSES"
            winnerLabel.isHidden = false
        }
    }
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        winnerLabel.isHidden = true
    }

}

