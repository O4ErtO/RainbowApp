//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Parameters
    private lazy var gameView = GameView(colorsArray: [.yellow, .orange, .blue, .red], titlesArray: ["green", "blue", "red"])
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        addNavBarButton()
        
    }
    //MARK: - Methods
    
}
//MARK: - ButtonGameDelegate
extension GameViewController: ButtonGameDelegate {
    func buttonTapped(button: UIButton) {
        
    }
    
    func addNavBarButton() {
        let buttonLeft = NavBarButton(with: .left)
        let buttonRight = NavBarButton(with: .right)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }
}

//MARK: - SetViews
extension GameViewController {
    private func setViews() {
        title = "00:00"
        
        view = gameView
        gameView.firstButton.delegate = self
        gameView.secondButton.delegate = self
        gameView.thirdButton.delegate = self
        gameView.fourButton.delegate = self
        gameView.fiveButton.delegate = self
    }
}
