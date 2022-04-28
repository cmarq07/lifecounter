//
//  ViewController.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/19/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allPlayers: [Player] = [
        Player(score: 20),
        Player(score: 20)
    ]
    
    var history: [String] = []
    
    @IBAction func addPlayer(_ sender: Any) {
        allPlayers.append(Player(score: 20))
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.clear
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is HistoryViewController {
            let vc = segue.destination as? HistoryViewController
            vc?.history = history
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return allPlayers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell {
            cell.player = allPlayers[indexPath.section]
            cell.configureCell(indexPath.section + 1)
            cell.delegate = self
            
            return cell
        }
        
        return UITableViewCell()
    }
}

extension ViewController: TableViewCellDelegate {
    func updateHistory(historyText: String) {
        history.append(historyText)
    }
    
    func checkGameOver() {
        var playersOut = 0
        for player in allPlayers {
            if(player.isOut()) {
                playersOut += 1
            }
        }
        
        // Game over state
        if(playersOut == allPlayers.count - 1) {
            var notOutPlayer = allPlayers.filter { !$0.isOut() }
            // Create new Alert
            var dialogMessage = UIAlertController(title: "Winner!", message: "\(notOutPlayer[0].name) won!!!", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)

            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
    }
}
