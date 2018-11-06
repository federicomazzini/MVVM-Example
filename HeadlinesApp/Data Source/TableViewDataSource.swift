//
//  TableViewDataSource.swift
//  HeadlinesApp
//
//  Created by federico mazzini on 31/10/2018.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

import UIKit

class TableViewDataSource<Cell: UITableViewCell, ViewModel> : NSObject, UITableViewDataSource {
    
    private var cellIdentifier: String!
    private var items: [ViewModel]!
    private var configureCell: (Cell, ViewModel) -> ()
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (Cell, ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell, item)
        return cell
    }
    
}
