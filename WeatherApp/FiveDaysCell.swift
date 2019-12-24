//
//  CurrentDayCell.swift
//  WeatherApp
//
//  Created by hiMac on 12.12.2019.
//  Copyright © 2019 XDD. All rights reserved.
//

import UIKit

class FiveDaysCell: UITableViewCell {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
     @IBOutlet weak var windLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
