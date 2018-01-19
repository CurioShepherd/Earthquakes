//
//  TableViewCell.swift
//  Earthquakes
//
//  Created by Koulutus on 21/11/2017.
//  Copyright © 2017 Koulutus. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nameEarthQuake: UILabel!
    
    @IBOutlet weak var magnitudeEarthQuake: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }    
}
