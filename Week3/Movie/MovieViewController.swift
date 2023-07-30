//
//  MovieViewController.swift
//  Week3
//
//  Created by 서동운 on 7/30/23.
//

import UIKit

class MovieViewController: UITableViewController {
    
    let movieList = movies

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelection = false
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MoviewViewCell.identifier, for: indexPath) as? MoviewViewCell else { return UITableViewCell() }
        
        cell.update(with: movieList[indexPath.row])
        
        return cell
    }
}
