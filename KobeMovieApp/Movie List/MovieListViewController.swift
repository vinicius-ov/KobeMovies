//
//  ViewController.swift
//  KobeMovieApp
//
//  Created by Vinicius Valvassori on 08/07/19.
//  Copyright © 2019 Vinicius Valvassori. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListViewController: UIViewController {

    @IBOutlet weak var movieListTable: UITableView!
    var moviesViewModel: MoviesViewModel!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTable), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        
        movieListTable.delegate = self
        movieListTable.dataSource = self
        
        moviesViewModel = MoviesViewModel.init(moviesService: MoviesService())
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "Search movie title here"
        definesPresentationContext = true
        navigationController?.navigationItem.searchController = searchController
    }

    @objc func reloadTable(){
        movieListTable.reloadData()
    }
}

extension MovieListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel.movieListSize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell") as! MovieListTableViewCell
        let movie = moviesViewModel.movieByIndex(index: indexPath.row)
        cell.movieName.text = movie.title
        //cell.genreName.text = movie.genreDict[movie.genreIds!.first!]
        cell.releaseDate.text = movie.releaseDate

        if let imageUrl = movie.backdropPath {
            let path = "https://image.tmdb.org/t/p/w1280/\(imageUrl)"
            cell.poster.kf.indicatorType = .activity
            cell.poster.kf.setImage(with: URL(string: path))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = moviesViewModel.movieByIndex(index: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        viewController.movieDetailViewModel = MovieDetailsViewModel.init(movieId: selectedMovie.id!)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let p = 0
    }
    
    
}
