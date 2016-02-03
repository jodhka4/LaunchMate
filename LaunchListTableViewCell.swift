//
//  LaunchListTableViewCell.swift
//  LaunchMate
//
//  Created by Tejasvi on 1/28/16.
//  Copyright © 2016 Tejasvi. All rights reserved.
//

import UIKit

class LaunchListTableViewCell: UITableViewCell {
    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var rocketLabel: UILabel!
    @IBOutlet weak var missionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
