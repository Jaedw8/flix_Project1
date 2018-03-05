 //
//  MovieCell.swift
//  flix_Project1
//
//  Created by Jasmine Edwards on 2/4/18.
//  Copyright © 2018 Jasmine Edwards. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieCell: UITableViewCell
{
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var movie: Movie! {
        didSet {
            titleLabel.text = movie.title
            
            overviewLabel.text = movie.overview
            
            posterImageView.af_setImage(withURL: movie.posterPathURL!)
            
        }
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
 
 
 
 
 
 
 
