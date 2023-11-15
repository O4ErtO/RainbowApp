//
//  settingsViewController.swift
//

import UIKit

class settingsViewController: UIViewController {
 
    var settingsModel: SettingsModel!
    
    override func loadView() {
        super.loadView()
        settingsModel = UserDefaultService.shared.getData(forKey: "Settings") ?? SettingsModel()
    }
    // MARK: - Parameters
    private let settingsView = SettingsView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        updateSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        UserDefaultService.shared.saveData(type: settingsModel, forKey: "Settings")
    }
}

extension settingsViewController {
    private func setViews() {
        view = settingsView
        settingsView.delegate = self
    }
    
    private func updateSettings () {
        settingsView.timeSlider.value = Float(settingsModel.gameTime)
        settingsView.timeSetLabel.text = String(format: "%.0f", settingsView.timeSlider.value) + " c"
        settingsView.speedSlider.value = Float(settingsModel.changeTime)
        settingsView.speedSetLabel.text = String(format: "%.0f", settingsView.speedSlider.value) + " c"
        settingsView.checkSwitch.isOn = settingsModel.isCountTask
        settingsView.exSizeLabel.font = .systemFont(ofSize: CGFloat(settingsModel.textSize))
        settingsView.stepper.value = settingsModel.textSize
        
        for (index,color) in settingsView.checkBoxColors.enumerated() {
            color.isChecked = settingsModel.selectedColors[index]
        }
        
        settingsView.bgSwitch.isOn = settingsModel.isTextBackground
        
        switch  settingsModel.backgroundColor {
        case "#FFFFFF": settingsView.bgControl.selectedSegmentIndex = 1
        case "#000000": settingsView.bgControl.selectedSegmentIndex = 2
        default: settingsView.bgControl.selectedSegmentIndex = 0
        }
        
        settingsView.backgroundColor = hexStringToUIColor(hex: settingsModel.backgroundColor)
        
        switch settingsModel.wordPosition {
        case .random:
            settingsView.positionControl.selectedSegmentIndex = 0
        case .center:
            settingsView.positionControl.selectedSegmentIndex = 1
        }
    }
}

extension settingsViewController: SettingsViewDelegate {
    func sliderChanged(sender: UISlider) {
        if sender == settingsView.timeSlider {
            settingsView.timeSetLabel.text = String(format: "%.0f", sender.value) + " c"
            settingsModel.gameTime = Int(sender.value)
        } else {
            settingsView.speedSetLabel.text = String(format: "%.0f", sender.value) + " c"
            settingsModel.changeTime = Int(sender.value)
        }
    }
    
    func switchAction(sender: UISwitch) {
        if sender == settingsView.checkSwitch {
            settingsModel.isCountTask.toggle()
            settingsView.checkSwitch.isOn = settingsModel.isCountTask
        } else {
            settingsModel.isTextBackground.toggle()
            settingsView.bgSwitch.isOn = settingsModel.isTextBackground
        }
    }
    
    func didTapColorBox(sender: UITapGestureRecognizer) {
        guard let checkBox = sender.view as? ColorboxView else { return }
        checkBox.toggle()
        if let index = settingsView.checkBoxColors.firstIndex(of: checkBox) {
            settingsModel.selectedColors[index].toggle()
        }
    }
    
    func stepperAction(sender: UIStepper) {
        settingsView.exSizeLabel.font = .systemFont(ofSize: sender.value)
        settingsModel.textSize = CGFloat(sender.value)
    }
    
    func changeBgColor(sender: UISegmentedControl) {
        UIView.animate(withDuration: 1) {
            switch sender.selectedSegmentIndex {
            case 1:
                self.settingsView.backgroundColor = .white
                self.settingsModel.backgroundColor = "#FFFFFF"
            case 2:
                self.settingsView.backgroundColor = .black
                self.settingsModel.backgroundColor = "#000000"
            default:
                self.settingsView.backgroundColor = .gray
                self.settingsModel.backgroundColor = "#00000033"
            }
        }
    }
    
    func wordPosition(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            settingsModel.wordPosition = .random
        default:
            settingsModel.wordPosition = .center
        }
    }
}

