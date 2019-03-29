//
//  MovieListViewController.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 19/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

  // MARK: - Properties

  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self,
                             action: #selector(refreshMoviesData(_:)),
                             for: UIControl.Event.valueChanged)
    let title = NSAttributedString(string: "Fetching Movies Data...", attributes: nil)
    refreshControl.attributedTitle = title
    return refreshControl
  }()

  private var movies: [Movie] = []

  var moviesService: MoviesServiceDelegate?

  var requestMovieDetail: ((_ movie: Movie) -> Void)?

  // MARK: - IBOutlets

  @IBOutlet weak var movieListTableView: UITableView! {
    didSet {
      movieListTableView.delegate = self
      movieListTableView.dataSource = self
      movieListTableView.register(nib: MovieTableViewCell.loadNib(),
                                  withCellClass: MovieTableViewCell.self)
      movieListTableView.refreshControl = refreshControl
    }
  }

  // MARK: - View life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    fetchMoviesData()
  }

  // MARK: - Data

  private func fetchMoviesData() {
    moviesService?.fetchMovies { [weak self] movies, error in
      guard error == nil else { return }
      self?.movies = movies
      DispatchQueue.main.async {
        self?.movieListTableView.reloadData()
        self?.refreshControl.endRefreshing()
      }
    }
  }

  // MARK: - Actions

  @objc private func refreshMoviesData(_ sender: Any) {
    fetchMoviesData()
  }

}

// MARK: - UITableViewDelegate
extension MovieListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return MovieTableViewCell.height()
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    requestMovieDetail?(movies[indexPath.row])
  }

}

// MARK: - UITableViewDataSource
extension MovieListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withClass: MovieTableViewCell.self, for: indexPath)
    cell.titleLabel.text = movies[indexPath.row].title
    cell.descriptionLabel.text = movies[indexPath.row].description
    return cell
  }

}
