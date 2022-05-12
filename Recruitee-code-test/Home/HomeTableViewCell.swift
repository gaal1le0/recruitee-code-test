//
//  HomeTableViewCell.swift
//  TMDBApp22
//
//  Created by Emanuel Martínez on 12/5/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleMarket: UILabel!
    @IBOutlet weak var market: UILabel!
    @IBOutlet weak var shortName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
