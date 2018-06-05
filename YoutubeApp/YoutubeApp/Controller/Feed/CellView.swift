//
//  CellView.swift
//  YoutubeApp
//
//  Created by Christopher on 05.06.18.
//  Copyright © 2018 Christopher. All rights reserved.
//

import UIKit

class CellView: UITableViewCell {
    
    
    //Vars
    
    //Outlets
    
    @IBOutlet weak var thumbImg: UIImageView!
    
    @IBOutlet weak var titelLabel: UILabel!
    
    
    //Actions
    
    
    //Methods
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
