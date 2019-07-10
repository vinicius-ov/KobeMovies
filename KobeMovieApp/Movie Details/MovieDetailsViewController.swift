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
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var overviewField: UITextView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var posterSize: NSLayoutConstraint! {
        didSet {
            if UIScreen.main.bounds.height < 670 {
                posterSize.constant = 380
            }
        }
    }
    
    var movieDetailViewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.dismiss))
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateDetailsUI), name: NSNotification.Name(rawValue: "updateDetails"), object: nil)
        
    }
    
    @objc func updateDetailsUI() {
        loadingIndicator.stopAnimating()
        titleLabel.text = movieDetailViewModel.movie!.title ?? ""
        genresLabel.text = movieDetailViewModel.movie!.getGenreListAsString()
        
        overviewField.text = movieDetailViewModel.movie!.overview ?? ""
        overviewField.setContentOffset(.zero, animated: false)
        releaseDate.text = movieDetailViewModel.movie!.releaseDate ?? ""
        
        guard let movie = movieDetailViewModel.movie, let posterPath = movie.posterPath else {
            return
        }
        
        let path = "https://image.tmdb.org/t/p/w342\(posterPath)"
        posterImage.kf.indicatorType = .activity
        posterImage.kf.setImage(with: URL(string: path))
        
    }
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
