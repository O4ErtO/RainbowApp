//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class RulesViewController: UIViewController {
    //MARK: - Parameters
    private let rulesView = RulesView()
    
    
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    //MARK: - Methods
    
}

extension RulesViewController {
    //MARK: - Methods
    
    private func setViews() {
        view = rulesView
    }
}


