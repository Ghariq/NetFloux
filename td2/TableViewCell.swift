//
//  TableViewCell.swift
//  td2
//
//  Created by Baptiste Godard on 30/11/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ltitrelo: UILabel!
    @IBOutlet weak var ldescriptionlo: UILabel!
    @IBOutlet weak var limagelo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
