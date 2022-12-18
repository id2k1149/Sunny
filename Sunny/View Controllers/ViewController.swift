//
//  ViewController.swift
//  Sunny
//
//  Created by Max Franz Immelmann on 12/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appid = ""
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=London&appid=" + appid
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let dataString = String(data: data, encoding: .utf8)
                print(dataString!)
            }
        }
        task.resume()
        
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert)
    }
}

