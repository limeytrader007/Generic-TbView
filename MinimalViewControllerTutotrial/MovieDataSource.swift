//
//  MovieDataSource.swift
//  MinimalViewControllerTutotrial
//
//  Created by Daniel Chapman on 5/6/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

class MovieDataSource: NSObject, UITableViewDataSource {
    private var movies: [Movie]
    
    init(movies: [Movie]){
        self.movies = movies
        super.init()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeReusableCell(forIndexPath: indexPath) as MovieCell
        
        let movie = movies[indexPath.row]
        //this path is provided by the API documentation
        let viewModel = MovieViewModel(model: movie)
        cell.setUpWith(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
}
