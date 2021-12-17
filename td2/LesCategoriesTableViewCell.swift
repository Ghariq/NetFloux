//
//  LesCategoriesTableViewCell.swift
//  td2
//
//  Created by Valentin Berthoz on 17/12/2021.
//

import UIKit

class LesCategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var nom_categorie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
