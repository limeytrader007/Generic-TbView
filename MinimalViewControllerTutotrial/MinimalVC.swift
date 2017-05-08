//
//  ViewController.swift
//  MinimalViewControllerTutotrial
//
//  Created by James Rochabrun on 4/26/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class MinimalVC: UITableViewController {
    
    var movies = [Movie]()
    var movieDataSource: MovieDataSource? {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        performNetworkCall()
    }
    
    private func setupViews(){
        view.backgroundColor = .white
        tableView.register(MovieCell.self)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        self.title = "Movies"
    }
    
    private func performNetworkCall(){
        MovieService.sharedInstance.getNowPlayingMovies { [weak self] (result) in
            guard let strongSelf = self else { return }
            switch result {
                case .Success(let dataSource):
                    strongSelf.movieDataSource = dataSource
                    strongSelf.tableView.dataSource = strongSelf.movieDataSource
                case .Error(let error):
                    print(error)
            }
        }
    }
}












