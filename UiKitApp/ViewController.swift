//
//  ViewController.swift
//  UiKitApp
//
//  Created by Александр Федоров on 29.02.2020.
//  Copyright © 2020 Alexander Fedorov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var hideSwitch: UISwitch!
    @IBOutlet var switchLabel: UILabel!
    @IBOutlet var mainStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Label
        mainLabel.text = ""
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Segmented control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        // Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        
        mainLabel.text = String(slider.value)
        
        // Date Picker
        datePicker.locale = Locale(identifier: "ru_RU")
        
        // Switch
        hideSwitch.onTintColor = .red
    }

    @IBAction func changeSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .green
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .blue
        default:
            break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @IBAction func doneButtonPressed() {
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            print("Wrong format")
            showAlert(with: "Wrong format!", and: "Please enter your name")
        } else {
            mainLabel.text = inputText
            userNameTextField.text = ""
        }
    }
    
    @IBAction func changeDate() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_RU")
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func hideAllElements() {
        mainStackView.isHidden.toggle()
        switchLabel.text = hideSwitch.isOn ? "Show all elements" : "Hide all elements"
    }
    
    
    
}

// MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

