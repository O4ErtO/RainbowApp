//
//  File.swift
//  RainbowApp
//
//  Created by Nikita Savchik on 15/11/2023.
//

import UIKit
import SnapKit

protocol ResultViewDelegate: AnyObject {
    func didTapClearResults()
}

class ResultView: UIView {
    
    weak var delegate: ResultViewDelegate?
    
    //MARK: - Parameters
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ResultCell.self, forCellReuseIdentifier: ResultCell.identifier)
        return tableView
    }()
    
    private let clearButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Очистить статистику", for: .normal)
        button.backgroundColor = .systemRed
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir Next Medium", size: 25)
        button.layer.cornerRadius = 15
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    func setDelegates(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    @objc func didClearButtonTapped() {
        delegate?.didTapClearResults()
    }
}

private extension ResultView {
    private func setupUI() {
        backgroundColor = .systemGray
        setupSubviews(
            tableView,
            clearButton
        )
    }
    
    private func setupSubviews(_ subview: UIView...) {
        subview.forEach { subview in
            addSubview(subview)
        }
        clearButton.addTarget(self, action: #selector(didClearButtonTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(80)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.bottom.equalTo(clearButton.snp.top).inset(-30)
        }
        
        clearButton.snp.makeConstraints { make in
            make.bottom.equalTo(safeAreaLayoutGuide).inset(40)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(40)
            make.height.equalTo(80)
        }
    }
}
