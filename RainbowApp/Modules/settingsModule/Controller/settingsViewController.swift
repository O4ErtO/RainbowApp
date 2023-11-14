//
//  settingsViewController.swift
//

import UIKit

class settingsViewController: UIViewController {
 
    // MARK: - Parameters
    private let settingsView = SettingsView()
        
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
}

extension settingsViewController {    
    private func setViews() {
        view = settingsView
        settingsView.delegate = self
    }
}

extension settingsViewController: SettingsViewDelegate {
    func sliderChanged(sender: UISlider) {
        if sender == settingsView.timeSlider {
            settingsView.timeSetLabel.text = String(format: "%.0f", sender.value) + " c"
        } else {
            settingsView.speedSetLabel.text = String(format: "%.0f", sender.value) + " c"
        }
    }
    
    func switchAction(sender: UISwitch) {}
    
    func didTapColorBox(sender: UITapGestureRecognizer) {
        guard let checkBox = sender.view as? ColorboxView else { return }
            checkBox.toggle()
    }
    
    func stepperAction(sender: UIStepper) {
        settingsView.exSizeLabel.font = .systemFont(ofSize: sender.value)
    }
    
    func changeBgColor(sender: UISegmentedControl) {
        UIView.animate(withDuration: 1) {
            switch sender.selectedSegmentIndex {
            case 1:
                self.settingsView.backgroundColor = UIColor.white
            case 2:
                self.settingsView.backgroundColor = UIColor.black
            default:
                self.settingsView.backgroundColor = UIColor.gray
            }
        }
    }
    
    func wordPosition(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
}
