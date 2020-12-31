//
//  RowOfTableViewCell.swift
//  AppReminder
//
//  Created by Nguyen Manh on 30/12/2020.
//

import UIKit



class RowOfTableViewCell: UITableViewCell {

    @IBOutlet weak var lblWork: UILabel!
    
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
