//
//  5ViewController.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class GameViewController: UIViewController {
    //MARK: - Parameters
    private lazy var gameView =  GameView(colorsArray: gameData.selectedColors.shuffled(), titleButton:  "X \(speed)")
    private let buttonLeft = NavBarButton(with: .left)
    private let buttonRight = NavBarButton(with: .right)
    private var counter = gameData.gameModel.currentCount
    private var timer: Timer?
    private var secondsRemaining = gameData.settingsModel.gameTime - gameData.gameModel.currentTime
    private var speed: Int = 1 //всего до 5х
    private var changeTime = gameData.settingsModel.changeTime
    private var time = gameData.gameModel.currentTime
    private var numberOfQuestions = gameData.gameModel.numberOfQuestions
    private var isPlaying = true
    
    private var titleTimer: String {
        switch secondsRemaining {
        case 60:
            return "01:00"
        case 10...59:
            return "00:\(secondsRemaining)"
        case 1...9:
            return "00:0\(secondsRemaining)"
        case 0:
            return "00:00"
        default:
            return ""
        }
    }
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Количество игр в начале: \(gameData.results.results.count)")
        gameData.updateColors()
        setViews()
        addNavBarButton()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    //MARK: - Methods
    
    @objc func updateTimer() {
        time += 1
        if time % max((changeTime/speed),1) == 0 {
            gameView.changeButtons()
            numberOfQuestions += 5
        }
        secondsRemaining -= 1
        switch secondsRemaining {
        case 60:
            title = "01:00"
        case 10...59:
            title = "00:\(secondsRemaining)"
        case 1...9:
            title = "00:0\(secondsRemaining)"
        case 0:
            timer?.invalidate()
            title = "Время вышло"
            print("Вы набрали \(counter) балла")
            buttonRight.isEnabled = false
            isPlaying = false
            gameData.addResult(Round(time: gameData.settingsModel.gameTime, guessed: counter, numberOfQuestions: numberOfQuestions, speed: speed))
            gameData.saveResults()
            gameData.gameModel = GameModel()
            gameData.saveGameModel()
            print("Количество игр: \(gameData.results.results.count)")
            for (index,round) in gameData.results.results.enumerated() {
                print("Очков в игре \(index+1):\(round.guessed)")
            }
           navigationController?.pushViewController(ResultsViewController(), animated: true)
        default:
            break
        }
    }
}
//MARK: - ButtonGameDelegate
extension GameViewController: ButtonGameDelegate {
    func buttonTapped(count: Int) {
        if count == 1 {
            counter += 1
        } else {
            counter -= 1
        }
        print(counter) //прописать функцию сохранения данных
    }
    
    //MARK: - AddNavBarButton
    func addNavBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: buttonLeft)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: buttonRight)
    }
}

//MARK: - SetViews
extension GameViewController {
    private func setViews() {
        view = gameView
        title = titleTimer
        gameView.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
        
        gameView.firstButton.delegate = self
        gameView.secondButton.delegate = self
        gameView.thirdButton.delegate = self
        gameView.fourButton.delegate = self
        gameView.fiveButton.delegate = self
        
        buttonLeft.delegate = self
        buttonRight.delegate = self
        gameView.delegate = self
    }
}

//MARK: - NavBarButtonDelegate
extension GameViewController: NavBarButtonDelegate {
    func leftBarButtonTapped() {
        gameData.gameModel.isPlaying = true
        gameData.gameModel.currentCount = counter
        gameData.gameModel.currentTime = time
        gameData.gameModel.numberOfQuestions = numberOfQuestions
        gameData.saveGameModel()
        gameData.saveResults()
        navigationController?.popViewController(animated: true)
        timer?.invalidate()
    }
    func rightBarButtonTapped() {
        if timer?.isValid == true {
            timer?.invalidate()
            print(secondsRemaining + 1)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
}

// Speed button Delegate
extension GameViewController: SpeedButtonDelegate {
    func speedTapped() {
        speed = (speed < 5) ? (speed + 1) : 1
        gameView.speedbutton.setTitle("X \(speed)", for: .normal)
    }
}




