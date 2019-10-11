//
//  primerTableViewCell.swift
//  Test_UPAX
//
//  Created by Eduardo Navarrete Carmona on 10/10/19.
//  Copyright © 2019 Eduardo Navarrete Carmona. All rights reserved.
//

import UIKit

class primerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var bulletImg: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
