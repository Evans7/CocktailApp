//
//  DrinkMinimalTableViewCell.swift
//  CocktailApp
//
//  Created by user235857 on 4/19/24.
//

import UIKit

class DrinkMinimalTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var drinkImage: UIImageView!
    
    @IBOutlet weak var drinkName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
