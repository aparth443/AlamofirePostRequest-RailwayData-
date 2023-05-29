//
//  MyTableViewCell.swift
//  POSTRequest-Alamofire
//
//  Created by cumulations on 29/05/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var trainName: UILabel!
    
    @IBOutlet weak var trainNumber: UILabel!
    
    @IBOutlet weak var trainFrom: UILabel!
    
    @IBOutlet weak var trainTo: UILabel!
    
    @IBOutlet weak var arrivalTime: UILabel!
    
    @IBOutlet weak var departureTime: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
