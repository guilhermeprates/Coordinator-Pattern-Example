//
//  MovieDetaiViewController.swift
//  Coordinator Pattern Example
//
//  Created by Guilherme Prates on 26/02/19.
//  Copyright © 2019 Guilherme Prates. All rights reserved.
//

import UIKit

class MovieDetaiViewController: UIViewController {

  // MARK: - Properties

  private let titles: [String] = [
    "Description",
    "Director",
    "Producer",
    "Release Date",
    "Score"
  ]

  private var data: [String] = []

  var movie: Movie? {
    didSet {
      guard let movie = self.movie else { return }
      title = movie.title
    }
  }

  // MARK: - IBOutlets

  @IBOutlet weak var movieDetailTableView: UITableView! {
    didSet {
      movieDetailTableView.delegate = self
      movieDetailTableView.dataSource = self
      movieDetailTableView.register(MovieDetailTableViewCell.loadNib(),
                                    forCellReuseIdentifier: MovieDetailTableViewCell.identifier)
      movieDetailTableView.tableFooterView = UIView()
      movieDetailTableView.separatorInset = UIEdgeInsets.zero
    }
  }

  // MARK: - View life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

}

// MARK: - UITableViewDelegate
extension MovieDetaiViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return MovieDetailTableViewCell.height()
  }

}

// MARK: - UITableViewDataSource
extension MovieDetaiViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieDetailTableViewCell.identifier, for: indexPath)
    return cell
  }
  
}
