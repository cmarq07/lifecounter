//
//  TableViewCell.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/26/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    // Buttons References
    @IBOutlet weak var plus1Button: UIButton!
    @IBOutlet weak var minus1Button: UIButton!
    @IBOutlet weak var plusXButton: UIButton!
    @IBOutlet weak var minusXButton: UIButton!
    
    // Input References
    @IBOutlet weak var plusXInput: UITextField!
    @IBOutlet weak var minusXInput: UITextField!
    
    // Labels
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    // Player
    var player: Player!
    
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
    
    func configureCell() {
        scoreLabel.text = "Score \(player.score)"
    }
    
    // Actions
    @IBAction func plus1Pressed(_ sender: Any) {
        player.add()
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func minus1Pressed(_ sender: Any) {
        player.subtract()
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func plusXPressed(_ sender: Any) {
        let xAmount = plusXInput.text!
        
        player.add(Int(xAmount)!)
        
        scoreLabel.text = "Score \(player.score)"
    }
    
    @IBAction func minusXPressed(_ sender: Any) {
        let xAmount = minusXInput.text!
        
        player.add(Int(xAmount)!)
        
        scoreLabel.text = "Score \(player.score)"
    }
}
