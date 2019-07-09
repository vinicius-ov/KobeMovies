//
//  MovieDetailsViewController.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 09/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @objc func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var movieDetailViewModel: MovieDetailsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.dismiss))
        
    }

}
