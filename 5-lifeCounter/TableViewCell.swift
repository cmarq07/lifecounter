//
//  TableViewCell.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/26/22.
//

import UIKit

protocol TableViewCellDelegate: UITableViewDelegate {
    func updateHistory(historyText: String)
}

class TableViewCell: UITableViewCell {
    // Buttons References
    @IBOutlet weak var plus1Button: UIButton!
    @IBOutlet weak var minus1Button: UIButton!
    @IBOutlet weak var plusXButton: UIButton!
    @IBOutlet weak var minusXButton: UIButton!
    
    // Input References
    @IBOutlet weak var plusXInput: UITextField!
    @IBOutlet weak var minusXInput: UITextField!
    @IBOutlet weak var playerNameInput: UITextField!
    
    // Labels
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Player
    var player: Player!
    
    // Delegate
    weak var delegate: TableViewCellDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Changing the state so it doesn't appear as "selected"
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        player = nil
    }
    
    func configureCell(_ num : Int) {
        player.setName("Player \(num)")
        playerNameInput.text = "Player \(num)"
        scoreLabel.text = "Score \(player.score)"
    }
    
    // Actions
    @IBAction func plus1Pressed(_ sender: Any) {
        player.add()
        delegate.updateHistory(historyText: "\(player.name) gained 1 life")
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func minus1Pressed(_ sender: Any) {
        player.subtract()
        delegate.updateHistory(historyText: "\(player.name) lost 1 life")
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func plusXPressed(_ sender: Any) {
        let xAmount = plusXInput.text!
        
        player.add(Int(xAmount)!)
        delegate.updateHistory(historyText: "\(player.name) gained \(xAmount) lives")
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func minusXPressed(_ sender: Any) {
        let xAmount = minusXInput.text!
        
        player.subtract(Int(xAmount)!)
        delegate.updateHistory(historyText: "\(player.name) lost \(xAmount) lives")
        
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func playerNameChanged(_ sender: Any) {
        player.setName(playerNameInput.text!)
    }
    
    func checkGameOver() {
        
    }
}
