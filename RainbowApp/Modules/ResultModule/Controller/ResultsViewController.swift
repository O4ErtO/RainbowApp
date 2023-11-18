//
//  ResultsViewController.swift
//  RainbowApp
//
//  Created by Nikita Savchik on 15/11/2023.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - Parameters
    let resultView = ResultView()
    var resultsData = gameData.results.results
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setNavAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        view = resultView
        view.backgroundColor = hexStringToUIColor(hex: gameData.settingsModel.backgroundColor)
        resultView.setDelegates(delegate: self, dataSource: self)
        resultView.delegate = self
        //set title appearance
        title = "Статистика"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30), .foregroundColor: gameData.getFontColor()]
    }
    
    private func setNavAppearance() {
        let leftButton = NavBarButton(with: .left)
        leftButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)
    }
    
    @objc func backButtonAction() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - TableView delegate
extension ResultsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}

//MARK: - TableView datasource
extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        resultsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ResultCell.identifier, for: indexPath) as? ResultCell else { return UITableViewCell() }
        cell.configure(round: resultsData[indexPath.row], gameNumber: indexPath.row + 1)
        
        return cell
    }
}

extension ResultsViewController: ResultViewDelegate {
    func didTapClearResults() {
        gameData.deleteResults()
        resultsData = []
        resultView.tableView.reloadData()
    }
}
