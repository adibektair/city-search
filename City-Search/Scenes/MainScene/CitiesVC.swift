//
//  CitiesVC.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import UIKit

class CitiesVC: UITableViewController, CitiesViewProtocol, Nibbed, UISearchBarDelegate {
    
    // MARK: - Variables
    var citiesList: [City] = []
    var presenter: CitiesPresenterProtocol?
    private lazy var searchBar = UISearchBar()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        fillTableView()
    }
    
    // MARK: - UI Setting up
    private func setUpUI() {
        tableView.reloadData()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = "Search..."
        searchBar.sizeToFit()
        searchBar.isTranslucent = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        navigationItem.titleView = searchBar
    }
    
    private func fillTableView(_ data: [City]? = nil) {
        if let newData = data {
            citiesList = newData
        } else {
            citiesList = presenter?.getAllCities() ?? []
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showMap(citiesList[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - SearchBar implementation
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        fillTableView(presenter?.filterCities(by: textSearched))
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        fillTableView(presenter?.getAllCities())
    }
}
