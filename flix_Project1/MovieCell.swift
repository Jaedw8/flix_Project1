 //
//  MovieCell.swift
//  flix_Project1
//
//  Created by Jasmine Edwards on 2/4/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell
{
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}

 class MovieFeedViewController:
 UIViewController,
 UITableViewDataSource,
 UITableViewDelegate
 {
    
    
    
    
    
 }
 
 
 
 
 
 
 
