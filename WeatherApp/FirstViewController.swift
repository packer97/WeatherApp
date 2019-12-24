import UIKit

class FirstViewController: UIViewController {
    var list = [Item]()
    var currentWeather = CurrentWeather()
    var cityName:String? = "CityName"
    var main:String? = "Main"
    var temperature: String? = "t˚"
    var wind:String? = "0"
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTemperatureLabel.isHidden = true
        cityNameLabel.isHidden = true
        mainLabel.isHidden = true
        windLabel.isHidden = true
        tableView.register(UINib(nibName: "FiveDaysCell", bundle: nil), forCellReuseIdentifier: "FiveDaysCell")
        setupNavigationBar()
    }
    
}
extension FirstViewController: UISearchResultsUpdating {
    private func update(from result: FiveDayWeather) {
        navigationItem.title = "WeatherApp"
        list = result.list!.compactMap { day in
            return day.self
        }
        print("\(list)")
        tableView.reloadData()
    }
    private func update(from result: CurrentWeather) {
        currentWeather = result
        print("\(list)")
        tableView.reloadData()
        currentTemperatureLabel.isHidden = false
        cityNameLabel.isHidden = false
        mainLabel.isHidden = false
        windLabel.isHidden = false
    }
    func setupNavigationBar() {
        self.navigationItem.title = "WatherApp"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    func updateSearchResults(for searchController: UISearchController) {
        let city = searchController.searchBar.text!
        APIServices.shared.getObject(cityName: city, domain: .domainForecast)
        {[weak self] (result : FiveDayWeather?, error: Error?) in
            if let error = error {
                print("\(error)")
            } else if let result = result {
                print("\(result)")
                self?.update(from: result)
            }
        }
        APIServices.shared.getObject(cityName: city, domain: .domainCurrentWeather)
        {[weak self] (result : CurrentWeather?, error: Error?) in
            if let error = error {
                print("\(error)")
            } else if let result = result {
                print("\(result)")
                self?.update(from: result)
                
            }
        }
        cityName = currentWeather.name
        temperature = Utils.celsius(currentWeather.main?.temp! ?? 0)
        main = currentWeather.weather?.first?.main
        wind = "Wind speed \(currentWeather.wind?.speed! ?? 0)"
        currentTemperatureLabel.text = temperature
        cityNameLabel.text = cityName
        mainLabel.text = main
        windLabel.text = wind
    }
}

extension FirstViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FiveDaysCell", for: indexPath) as! FiveDaysCell
        let temperature = Utils.celsius(list[indexPath.row].main!.temp!)
        cell.tempLabel.text = temperature
        cell.dayLabel.text = list[indexPath.row].dt_txt
        cell.mainLabel.text = list[indexPath.row].weather!.first!.main!
        cell.windLabel.text = "Wind speed \(list[indexPath.row].wind.speed!)"
        return cell
        
        
    }
    
}

extension FirstViewController: UITableViewDelegate {
    
}
