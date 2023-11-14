//
//  5View.swift
//

import UIKit


class RulesView: UIView {
    
    //MARK: - Parameters
    
    private lazy var whiteSquare: UIView = {
        
        let squareView = UIView(frame: .zero)
        squareView.backgroundColor = .white

        return squareView
    }()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        
        label.text = RulesModel.Label.titleOfRulesGame
        label.textColor = RulesModel.Color.colorForTitle
        label.font = UIFont.systemFont(ofSize: 28)
        
        return label
    }()
    
    
    private lazy var firstPartDescription: UILabel = {
        let label = UILabel()
        
        let attributedString = NSMutableAttributedString(string: RulesModel.Label.desctiptionFirstPart)
        
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 84, length: 7))
        
        label.textColor = .black
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 5
        
        return label
    }()
    
    
    private lazy var HstackView: UIStackView = {
        let stack = UIStackView()
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .horizontal
        stack.spacing = 50
            
            stack.addArrangedSubview(VstackViewForLeft)
            stack.addArrangedSubview(VstackForRight)
        
        return stack
    }()
    
    private lazy var VstackViewForLeft: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.addArrangedSubview(offWord)
        stack.addArrangedSubview(BackOffWord)
        
        return stack
    }()
    
    private lazy var VstackForRight: UIStackView = {
        
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.addArrangedSubview(onWord)
        stack.addArrangedSubview(buttonOn)
        
        return stack
    }()
   
    private lazy var onWord: UILabel = {
        let label = UILabel()
        
        label.text = RulesModel.Label.backgroundOn
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    private lazy var buttonOn: UIButton = {
        let button = UIButton()
        
        button.setTitle(RulesModel.Label.textLables, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        
        return button
    }()
    private lazy var offWord: UILabel = {
        let label = UILabel()
        
        label.text = RulesModel.Label.backgroundOff
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 10)
        
        return label
    }()
    
    private lazy var BackOffWord: UILabel = {
        let label = UILabel()
        
        label.text = RulesModel.Label.textLables
        label.textColor = .green
        label.shadowColor = .black
        label.font = UIFont.systemFont(ofSize: 24)
        
        return label
    }()
    
    private lazy var secondPartDescripton: UILabel = {
        let label = UILabel()
        
        let attributedString = NSMutableAttributedString(string: RulesModel.Label.descriptionSecondPart)
        attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 161, length: 17))
        label.textColor = .black
        label.attributedText = attributedString
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 10
        
        return label
    }()
    
    private lazy var thirdPartDescripton: UILabel = {
        let label = UILabel()
        
        label.textColor = .black
        label.text = RulesModel.Label.desctiptionThirdPart
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .left
        label.numberOfLines = 10
        
        return label
    }()
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
    //MARK: - Methods
    
    private func setupView() {
        addSubview(whiteSquare)
        whiteSquare.addSubview(title)
        whiteSquare.addSubview(firstPartDescription)
        whiteSquare.addSubview(HstackView)
        whiteSquare.addSubview(secondPartDescripton)
        whiteSquare.addSubview(thirdPartDescripton)
    }
    
    private func setupConstraints() {
        
        whiteSquare.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        firstPartDescription.translatesAutoresizingMaskIntoConstraints = false
        secondPartDescripton.translatesAutoresizingMaskIntoConstraints = false
        thirdPartDescripton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whiteSquare.centerXAnchor.constraint(equalTo: centerXAnchor),
            whiteSquare.centerYAnchor.constraint(equalTo: centerYAnchor),
            whiteSquare.topAnchor.constraint(equalTo: topAnchor, constant: 160),
            whiteSquare.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            whiteSquare.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            whiteSquare.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            // Title
            title.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            title.topAnchor.constraint(equalTo: whiteSquare.topAnchor, constant: 16),
            
            //firstPart
            
            firstPartDescription.topAnchor.constraint(equalTo: title.topAnchor, constant: 40),
            firstPartDescription.leadingAnchor.constraint(equalTo: whiteSquare.leadingAnchor, constant: 25),
            firstPartDescription.trailingAnchor.constraint(equalTo: whiteSquare.trailingAnchor, constant: -10),
            
            //HstackView
            HstackView.topAnchor.constraint(equalTo: firstPartDescription.bottomAnchor, constant: 20),
            HstackView.centerXAnchor.constraint(equalTo: whiteSquare.centerXAnchor),
            buttonOn.widthAnchor.constraint(equalToConstant: 96),
            buttonOn.heightAnchor.constraint(equalToConstant: 26),
            
            
            //secondPart
            secondPartDescripton.topAnchor.constraint(equalTo: HstackView.bottomAnchor, constant: 40),
            secondPartDescripton.leadingAnchor.constraint(equalTo: whiteSquare.leadingAnchor, constant: 25),
            secondPartDescripton.trailingAnchor.constraint(equalTo: whiteSquare.trailingAnchor, constant: -10),
            
            //thirdPart
            thirdPartDescripton.bottomAnchor.constraint(equalTo: whiteSquare.bottomAnchor, constant: -15),
            thirdPartDescripton.leadingAnchor.constraint(equalTo: whiteSquare.leadingAnchor, constant: 25),
            thirdPartDescripton.trailingAnchor.constraint(equalTo: whiteSquare.trailingAnchor, constant: -10)
        ])
    }
}
