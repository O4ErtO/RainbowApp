//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    //MARK: - Parameters
    private let settingsView = SettingsView()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    //MARK: - Methods
    
}

extension SettingsViewController {
    
    private func setViews() {
        view = settingsView

    }
}
