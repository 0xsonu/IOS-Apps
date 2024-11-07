
import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchTextField.delegate = self
        weatherManager.delegate = self
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }

}

//MARK: - CLLocationManagerDelegate

extension WeatherViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Got Location Data: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}

//MARK: - UITextFieldDelegate

extension WeatherViewController : UITextFieldDelegate {
    @IBAction func handleSearchClick(_ sender: UIButton) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // api call based on city
        print(searchTextField.text!)
        if let city = searchTextField.text {
            weatherManager.fetchWeatherData(for: city)
        }
        
        searchTextField.text = ""
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        }else {
            textField.placeholder = "Enter City Name"
            return false
        }
    }
}

//MARK: - WeatherManagerDelegate

extension WeatherViewController : WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: Weather) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.cityLabel.text = weather.cityName
            self.conditionImageView.image =  UIImage(systemName: weather.wetherConditionIcon)
        }
    }
    
    func didFailedWithError(_ error: any Error) {
        print("Failed with Error: \(error)" )
    }
}


