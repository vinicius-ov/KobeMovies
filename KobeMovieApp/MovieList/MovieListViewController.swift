//
//  ViewController.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTable: UITableView!
    var movieListViewModel: MovieListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieListTable.delegate = self
        movieListTable.dataSource = self
        
        movieListViewModel = MovieListViewModel.init(moviesService: MoviesService())
        
    }


}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.movieListSize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        
        //cell.label = data!!!
        
        return cell
    }
    
    
}
