//
//  WeatherDataPage.swift
//  WeatherApp
//
//  Created by Krishna Bhatt on 25/07/21.
//
import UIKit

class WeatherDataPage: UIViewController {

    private let mytableview = UITableView()
        private var tabledata = [CityDetail]()

        
        private let searchbar = UISearchBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(mytableview)
              mytablesetviewsetup()
              
              view.addSubview(searchbar)
              searchbar.delegate =  self
    }
    
    override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           view.backgroundColor = .white
           searchbar.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: 50)
           
           mytableview.frame = CGRect(x: 0, y: searchbar.bottom+20, width: view.width, height: view.height-view.safeAreaInsets.top - view.safeAreaInsets.bottom)
       }

}
extension WeatherDataPage: UITableViewDataSource,UITableViewDelegate{
    
    private func mytablesetviewsetup(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(WeatherCellPage.self, forCellReuseIdentifier: "WeatherCellPage")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tabledata.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCellPage",for: indexPath) as! WeatherCellPage
        
        cell.setupcell(city: tabledata[indexPath.row])
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension WeatherDataPage :UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        print("searching..")
        view.endEditing(true)
        tabledata = ApiHandler.shared.searchcity(with: searchBar.text!)
        mytableview.reloadData()
    }
}
