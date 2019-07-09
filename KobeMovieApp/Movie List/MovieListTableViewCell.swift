//
//  MovieListTableViewCell.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var genreName: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
