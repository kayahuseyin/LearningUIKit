//
//  ViewController.swift
//  SearchBar
//
//  Created by Hüseyin Kaya on 16.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    var countries: [String] = [String]()
    var searchedCountries: [String] = [String]()
    
    var searchingStatus = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
       
        countries = [
            "Türkiye", "Germany", "France", "Korea", "Sweden", "Japan", "Albania", "Montenegro",
            "Italy", "Spain", "Canada", "Australia", "Brazil", "China", "Egypt", "India", "Mexico",
            "Nigeria", "Russia", "South Africa", "United Kingdom", "United States", "Argentina",
            "Indonesia", "Pakistan", "Bangladesh", "Philippines", "Vietnam", "Ethiopia"
        ]
        
        self.searchBar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Duruma gore ulkeler listelenecek
        if searchingStatus {
            return searchedCountries.count
        } else {
            return countries.count
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // arama yapiliyorsa aramanin sonucu goruntulenecek
        
        if searchingStatus {
            cell.textLabel?.text = searchedCountries[indexPath.row]
        } else {
            cell.textLabel?.text = countries[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        if searchingStatus {
            print(searchedCountries[indexPath.row])
        } else {
            print(countries[indexPath.row])
        }
    }
    
}


extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) { // Arama yapildigi anda sonucu donduren metod
        // searchText anlik aratilan text'i dondurur.
        print(searchText)
        
        if searchText == "" {
            searchingStatus = false // otherwise after we cancel the search, the tableview would be empty.
        } else {
            searchingStatus = true
            searchedCountries = countries.filter({$0.lowercased().starts(with: searchText.lowercased())})
            //searchedCountries = countries.filter({$0.lowercased().contains(searchText.lowercased())})
        }
        
        
        
        tableView.reloadData()
    }
    
    }

