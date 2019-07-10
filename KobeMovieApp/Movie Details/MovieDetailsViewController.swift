//
//  MovieDetailsViewController.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 09/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    
    var movieDetailViewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.dismiss))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateDetailsUI), name: NSNotification.Name(rawValue: "updateDetails"), object: nil)
        
    }
    
    @objc func updateDetailsUI() {
        titleLabel.text = movieDetailViewModel.movie!.title ?? ""
        //genresLabel.text = genres
        overviewLabel.text = movieDetailViewModel.movie!.overview ?? ""
        releaseDate.text = movieDetailViewModel.movie!.releaseDate ?? ""
    }
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
