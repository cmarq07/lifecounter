//
//  HomeViewController.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/27/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var playersInput: UITextField!
    
    @IBAction func numPlayersChanged(_ sender: Any) {
        numPlayers = Int(playersInput.text!) ?? 0
        if numPlayers < 2 {
            numPlayers = 2
        }
        
        if numPlayers > 8 {
            numPlayers = 8
        }
        print("value changed to \(String(describing: numPlayers))")
    }
    
    
    var numPlayers : Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ViewController {
            let vc = segue.destination as? ViewController
            var players : [Player] = []
            for _ in 0..<numPlayers {
                players.append(Player(score: 20))
            }
            vc?.allPlayers = players
        }
    }
}
