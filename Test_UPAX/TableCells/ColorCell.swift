//
//  ColorCell.swift
//  Test_UPAX
//
//  Created by Eduardo Navarrete Carmona on 13/10/19.
//  Copyright © 2019 Eduardo Navarrete Carmona. All rights reserved.
//

import UIKit

class ColorCell: UITableViewCell {

    
    @IBOutlet weak var colorLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
