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
        setNavAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
    }
}

extension RulesViewController {
    //MARK: - Methods
    
    private func setViews() {
        view = rulesView
    }
    
    private func setNavAppearance() {
        //title
        title = RulesModel.Label.title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), .foregroundColor: gameData.getFontColor()]
        //navigationBar
        let leftButton = NavBarButton(with: .left)
        leftButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    @objc func backButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}


