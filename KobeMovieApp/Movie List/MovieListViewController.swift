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
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.reloadTable), name: NSNotification.Name(rawValue: "reloadTable"), object: nil)
        
        movieListTable.delegate = self
        movieListTable.dataSource = self
        
        moviesViewModel = MoviesViewModel.init(moviesService: MoviesService())
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = true
        definesPresentationContext = true
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.init(red: 255/255, green: 43/255, blue: 119/255, alpha: 1.0)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    @objc func reloadTable(){
        loadingIndicator.stopAnimating()
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
        cell.genreName.text = movie.getGenreListAsString()
        cell.releaseDate.text = movie.releaseDate
        
        if let imageUrl = movie.backdropPath {
            let path = "https://image.tmdb.org/t/p/w780/\(imageUrl)"
            cell.backdrop.kf.indicatorType = .activity
            cell.backdrop.kf.setImage(with: URL(string: path))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = moviesViewModel.movieByIndex(index: indexPath.row)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController =
            storyboard.instantiateViewController(withIdentifier: "MovieDetailsViewController") as! MovieDetailsViewController
        viewController.movieDetailViewModel = MovieDetailsViewModel.init(movieId: selectedMovie.id!)
        viewController.movieDetailViewModel.genreIds = selectedMovie.genreIds!
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MovieListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let filtered = moviesViewModel.movies.filter { $0.title!.contains(searchController.searchBar.text!) }
        if filtered.count == 0 && searchController.searchBar.text!.count == 0 {
            moviesViewModel.movies = moviesViewModel.initialList
        }else{
            moviesViewModel.movies = filtered
        }
        reloadTable()
    }
}

