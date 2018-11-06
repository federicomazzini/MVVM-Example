//
//  HeadlinesTableViewController.swift
//  HeadlinesApp
//
//  Created by Mohammad Azam on 12/16/17.
//  Copyright © 2017 Mohammad Azam. All rights reserved.
//

import Foundation
import UIKit

class HeadlinesTableViewController : UITableViewController {
    
    var sourceViewModel: SourceViewModel!
    private var headLineListViewModel: HeadlineListViewModel!
    private var dataSource: TableViewDataSource<HeadlineTableViewCell, HeadLineViewModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    private func updateUI() {
        
        self.title = self.sourceViewModel.name
        
        headLineListViewModel = HeadlineListViewModel(sourceViewModel: self.sourceViewModel, completion: {
            self.dataSource = TableViewDataSource(cellIdentifier: "Cell", items: self.headLineListViewModel.headlineViewModels, configureCell: { cell, vm in
                
                cell.titleLabel.text = vm.title
                cell.descriptionLabel.text = vm.description
            })
            
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        })
    }
    
}
