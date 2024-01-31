//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Setting a delegate to the cuurent view i.e., the searchTextField must communicate with the view
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        // To say that we are done typing and thr keyboard can hide now
        searchTextField.endEditing(true)
        print(searchTextField.text!)
    }
    
    
    
    // These methods are called by the UITextField class itself depending
    // on which textField caused this to occur.
    // It then send the reference of that particular textField to the function.
    
    // Method that comes from the delegate, say whether if the return key is touched, it should be processed or not
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        print(searchTextField.text!)
        return true
    }
    
    // Asks for permission whether the textField should end editing or not, useful for validation purposes.
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    
    // Again a method from which is product of the delegate.
    // Helps us write code to be executed when the user
    // stops editing the textField
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        // Use the input from the textField to get the weather for that city.
        if let city = searchTextField.text
        {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

