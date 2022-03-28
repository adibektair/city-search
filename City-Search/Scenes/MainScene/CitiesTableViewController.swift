//
//  CitiesTableViewController.swift
//  City-Search
//
//  Created by tair on 26.03.22.
//

import UIKit

class CitiesTableViewController: UITableViewController, CitiesViewProtocol {
    
    var citiesList: [City] = []
    weak var presenter: CitiesPresenterProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func refreshTable(with data: [City]) {
        if !self.isViewLoaded {
            return
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let city = citiesList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = city.displayTitle
        content.secondaryText = city.displaySubtitle
        cell.contentConfiguration = content
        return cell
    }

}
