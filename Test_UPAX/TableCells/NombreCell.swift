//
//  NombreCell.swift
//  Test_UPAX
//
//  Created by Eduardo Navarrete Carmona on 13/10/19.
//  Copyright © 2019 Eduardo Navarrete Carmona. All rights reserved.
//

import UIKit

class NombreCell: UITableViewCell, UITextFieldDelegate {

    
    @IBOutlet weak var nombreTxtFld: UITextField!
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        nombreTxtFld.delegate = self
        nombreTxtFld.smartInsertDeleteType = UITextSmartInsertDeleteType.no

        guard let textFieldText = nombreTxtFld.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= 5
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
