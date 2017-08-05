//
//  DashBoardCell.swift
//  CoreDataDemo
//
//  Created by Jitendra on 5/8/17.
//  Copyright © 2017 Jitendra. All rights reserved.
//

import UIKit

class EmpolyessDetailsCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPhoneNumber: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
