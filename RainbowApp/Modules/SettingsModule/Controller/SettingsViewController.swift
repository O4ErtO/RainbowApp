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
        updateSettings()
        setNavAppearance()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        gameData.saveSettings()
    }
}

extension settingsViewController {
    private func setViews() {
        view = settingsView
        settingsView.delegate = self
    }
    
    private func setNavAppearance() {
        //title
        title = SettingsLabel.settings
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), .foregroundColor: gameData.getFontColor()]
        //navigationBar
        let leftButton = NavBarButton(with: .left)
        leftButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    @objc func backButtonAction() {
        navigationController?.popToRootViewController(animated: true)
        gameData.gameModel = GameModel()
        gameData.saveGameModel()
    }
    
    private func updateSettings () {
        settingsView.timeSlider.value = Float(gameData.settingsModel.gameTime)
        settingsView.timeSetLabel.text = String(format: "%.0f", settingsView.timeSlider.value) + " c"
        settingsView.speedSlider.value = Float(gameData.settingsModel.changeTime)
        settingsView.speedSetLabel.text = String(format: "%.0f", settingsView.speedSlider.value) + " c"
        settingsView.checkSwitch.isOn = gameData.settingsModel.isCountTask
        settingsView.exSizeLabel.font = .systemFont(ofSize: CGFloat(gameData.settingsModel.textSize))
        settingsView.stepper.value = gameData.settingsModel.textSize
        
        for (index,color) in settingsView.checkBoxColors.enumerated() {
            color.isChecked = gameData.settingsModel.selectedColors[index]
        }
        
        settingsView.bgSwitch.isOn = gameData.settingsModel.isTextBackground
        
        switch  gameData.settingsModel.backgroundColor {
        case "#FFFFFF": settingsView.bgControl.selectedSegmentIndex = 1
        case "#000000": settingsView.bgControl.selectedSegmentIndex = 2
        default: settingsView.bgControl.selectedSegmentIndex = 0
        }
        
        settingsView.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
        
        switch gameData.settingsModel.wordPosition {
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
            gameData.settingsModel.gameTime = Int(sender.value)
        } else {
            settingsView.speedSetLabel.text = String(format: "%.0f", sender.value) + " c"
            gameData.settingsModel.changeTime = Int(sender.value)
        }
    }
    
    func switchAction(sender: UISwitch) {
        if sender == settingsView.checkSwitch {
            gameData.settingsModel.isCountTask.toggle()
            settingsView.checkSwitch.isOn = gameData.settingsModel.isCountTask
        } else {
            gameData.settingsModel.isTextBackground.toggle()
            settingsView.bgSwitch.isOn = gameData.settingsModel.isTextBackground
        }
    }
    
    func didTapColorBox(sender: UITapGestureRecognizer) {
        guard let checkBox = sender.view as? ColorboxView else { return }
        checkBox.toggle()
        if let index = settingsView.checkBoxColors.firstIndex(of: checkBox) {
            gameData.settingsModel.selectedColors[index].toggle()
        }
    }
    
    func stepperAction(sender: UIStepper) {
        settingsView.exSizeLabel.font = .systemFont(ofSize: sender.value)
        gameData.settingsModel.textSize = CGFloat(sender.value)
    }
    
    func changeBgColor(sender: UISegmentedControl) {
        UIView.animate(withDuration: 1) {
            switch sender.selectedSegmentIndex {
            case 1:
                self.settingsView.backgroundColor = .white
                gameData.settingsModel.backgroundColor = "#FFFFFF"
            case 2:
                self.settingsView.backgroundColor = .black
                gameData.settingsModel.backgroundColor = "#000000"
            default:
                self.settingsView.backgroundColor = .gray
                gameData.settingsModel.backgroundColor = "#00000033"
            }
            self.settingsView.customCell.forEach { cell in
                cell.layer.shadowColor = gameData.getFontColor().cgColor
            }
            self.setNavAppearance()
        }
    }
    
    func wordPosition(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            gameData.settingsModel.wordPosition = .random
        default:
            gameData.settingsModel.wordPosition = .center
        }
    }
}

