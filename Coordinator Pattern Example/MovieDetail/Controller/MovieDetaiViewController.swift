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

  var movie: Movie?

  // MARK: - IBOutlets

  @IBOutlet weak var movieDetailTableView: UITableView! {
    didSet {
      movieDetailTableView.delegate = self
      movieDetailTableView.dataSource = self
    }
  }

  // MARK: - View life cycle

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
  }

}

// MARK: - UITableViewDelegate
extension MovieDetaiViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource
extension MovieDetaiViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
}
