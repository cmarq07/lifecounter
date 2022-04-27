//
//  HistoryTableViewCell.swift
//  5-lifeCounter
//
//  Created by Christian Marquis Calloway on 4/27/22.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
    
    var historyItem: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        historyItem = nil
    }
    
    func configureCell() {
        cellLabel.text = historyItem
    }

}
