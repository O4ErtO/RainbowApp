//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class settingsViewController: UIViewController {
    //MARK: - Parameters
    private let settingsView = SettingsView()
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setViews()
    }
    
    //MARK: - Methods
    
}

extension settingsViewController {
    
    private func setViews() {
        view = settingsView

    }
}
