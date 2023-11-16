//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Nikolay1414 on 09.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Parameters
    private let mainView = MainView()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
    }

    
}

extension MainViewController {
    //MARK: - Methods
    private func setViews() {
        view = mainView
        mainView.delegate = self
    }
}

extension MainViewController: MainViewDelegate {
    func didTapNewGameButton() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapNextButton() {
        let vc = GameViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapStatiticButton() {
         let vc = ResultsViewController()
         navigationController?.pushViewController(vc, animated: true)
    }
    
    func didTapConfigButton() {
        let vc = settingsViewController()
        navigationController?.pushViewController(vc, animated: true)

    }
    
    func didTapQuestionButton() {
        let vc = RulesViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
}
