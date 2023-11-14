//
//  5View.swift
//  RainbowApp
//
//  Created by Dmitry on 09.11.2023.
//

import UIKit

class SettingsView: UIView {

    //MARK: - Parameters
    private var mainStackView = UIStackView()
    private var scrollView = UIScrollView()
    private var colorRowStackView = UIStackView()
    private var colorSecondRowStackView = UIStackView()
    
    var customCell = [
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero),
       SettingsCellView(frame: .zero)
       ]
    
    var checkBoxColors = [
        ColorboxView(color: .cyan),
        ColorboxView(color: .green),
        ColorboxView(color: .blue),
        ColorboxView(color: .purple),
        ColorboxView(color: .systemPink),
        ColorboxView(color: .orange),
        ColorboxView(color: .red),
        ColorboxView(color: .yellow),
        ColorboxView(color: .magenta),
        ColorboxView(color: .systemIndigo),
        ColorboxView(color: .black),
        ColorboxView(color: .gray)
    ]
    
    // cell 1
    private lazy var gameTimeLabel = UILabel(text: "Время игры")
    private let timeSlider = UISlider(maxValue: 60, minValue: 5)
    private lazy var timeSetLabel = UILabel(text: String(format: "%.0f", timeSlider.value) + " c")
    
    // cell 2
    private lazy var speedLabel = UILabel(text: "Скорость смены заданий")
    private let speedSlider = UISlider(maxValue: 15, minValue: 1)
    private lazy var speedSetLabel = UILabel(text: String(format: "%.0f", speedSlider.value) + " c")
    
    // cell 3
    private lazy var isCheckLabel = UILabel(text: "Игра с проверкой заданий")
    let checkSwitch = UISwitch(isOn: true)
    
    // cell 4
    private lazy var colorLabel = UILabel(text: "Цвета букв")
    
    // cell 5
    private lazy var sizeLetterLabel = UILabel(text: "Размер букв")
    private var stepper = UIStepper(maxValue: 36, minValue: 12, value: 20)
    private lazy var exSizeLabel = UILabel(text: "Aa")
    
    // cell 6
    private lazy var wordBgLabel = UILabel(text: "Подложка для букв")
    let bgSwitch = UISwitch(isOn: false)
   
    // cell7
    private lazy var bgColorLabel = UILabel(text: "Цвет фона")
    private lazy var bgControl = UISegmentedControl(
        items: ["Серый", "Белый", "Черный"],
        selectedIndex: 0
    )
    // cell 8
    private lazy var positionLabel = UILabel(text: "Расположение слова на экране")
    private lazy var positionControl = UISegmentedControl(
        items: ["Случайное", "По центру"],
        selectedIndex: 0
    )
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    //MARK: - Methods
    @objc func sliderChanged (_ sender: UISlider) {
        if sender == timeSlider {
            timeSetLabel.text = String(format: "%.0f", sender.value) + " c"
        } else {
            speedSetLabel.text = String(format: "%.0f", sender.value) + " c"
        }
    }
    
    @objc func stepperAction(sender: UIStepper) {
        exSizeLabel.font = .systemFont(ofSize: sender.value)
    }
    
    @objc func switchAction(sender: UISwitch) {
        if sender.isOn {
        } else {
        }
    }
    
    @objc func changeColor(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 1:
                self.backgroundColor = UIColor.white
            case 2:
                self.backgroundColor = UIColor.black
            default:
                self.backgroundColor = UIColor.gray
            }
    }
    
    @objc func wordPosition(_ sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
    }
    
    @objc func didTapCheckbox(sender: UITapGestureRecognizer) {
        let checkBox = sender.view as! ColorboxView
            checkBox.toggle()
    }
    
    
    
    private func setUpView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = true
        addSubview(scrollView)
        
        mainStackView = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: customCell
        )
        mainStackView.spacing = 24
        mainStackView.alignment = .center
        scrollView.addSubview(mainStackView)
        
        customCell[0].addSubview(gameTimeLabel)
        customCell[0].addSubview(timeSlider)
        customCell[0].addSubview(timeSetLabel)
        timeSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    
        customCell[1].addSubview(speedLabel)
        customCell[1].addSubview(speedSlider)
        customCell[1].addSubview(speedSetLabel)
        speedSlider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
        
        customCell[2].addSubview(isCheckLabel)
        customCell[2].addSubview(checkSwitch)
        checkSwitch.addTarget(self, action: #selector(switchAction(sender:)), for: .valueChanged)
        
        colorRowStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillProportionally,
            subViews: Array(checkBoxColors[0...5])
            )
        colorRowStackView.spacing = 8
        colorSecondRowStackView = UIStackView(
            axis: .horizontal,
            distribution: .fillProportionally,
            subViews: Array(checkBoxColors[6...11])
            )
        colorSecondRowStackView.spacing = 8
        
        customCell[3].addSubview(colorRowStackView)
        customCell[3].addSubview(colorSecondRowStackView)
        customCell[3].addSubview(colorLabel)
        
        for button in checkBoxColors {
            button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapCheckbox)))
        }
        
        customCell[4].addSubview(sizeLetterLabel)
        customCell[4].addSubview(stepper)
        customCell[4].addSubview(exSizeLabel)
        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        
        customCell[5].addSubview(wordBgLabel)
        customCell[5].addSubview(bgSwitch)
        
        customCell[6].addSubview(bgColorLabel)
        customCell[6].addSubview(bgControl)
        bgControl.addTarget(self, action: #selector(changeColor), for: .valueChanged)
        
        customCell[7].addSubview(positionLabel)
        customCell[7].addSubview(positionControl)
        positionControl.addTarget(self, action: #selector(wordPosition), for: .valueChanged)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            gameTimeLabel.leadingAnchor.constraint(equalTo: customCell[0].leadingAnchor, constant: 16),
            gameTimeLabel.centerYAnchor.constraint(equalTo: customCell[0].centerYAnchor),
            
            timeSlider.leadingAnchor.constraint(equalTo: gameTimeLabel.trailingAnchor, constant: 16),
            timeSlider.centerYAnchor.constraint(equalTo: customCell[0].centerYAnchor),
            timeSlider.widthAnchor.constraint(equalToConstant: 150),
            timeSetLabel.centerYAnchor.constraint(equalTo: timeSlider.centerYAnchor),
            timeSetLabel.trailingAnchor.constraint(equalTo: customCell[0].trailingAnchor, constant: -16),
    // cell 2
            speedLabel.leadingAnchor.constraint(equalTo: customCell[1].leadingAnchor, constant: 16),
            speedLabel.widthAnchor.constraint(equalToConstant: 180),
            speedLabel.topAnchor.constraint(equalTo: customCell[1].topAnchor,constant: 24),
            speedLabel.centerYAnchor.constraint(equalTo: customCell[1].centerYAnchor),
            
            speedSlider.centerYAnchor.constraint(equalTo: customCell[1].centerYAnchor, constant: -12),
            speedSlider.centerXAnchor.constraint(equalTo: customCell[1].centerXAnchor, constant: 24),
            speedSlider.widthAnchor.constraint(equalToConstant: 120),
            speedSlider.leadingAnchor.constraint(equalTo: speedLabel.trailingAnchor, constant: -36),
            
            speedSetLabel.trailingAnchor.constraint(equalTo: customCell[1].trailingAnchor, constant: -16),
            speedSetLabel.centerYAnchor.constraint(equalTo: speedSlider.centerYAnchor),
      // cell 3
            isCheckLabel.leadingAnchor.constraint(equalTo: customCell[2].leadingAnchor, constant: 16),
            isCheckLabel.centerYAnchor.constraint(equalTo: customCell[2].centerYAnchor),
            isCheckLabel.widthAnchor.constraint(equalToConstant: 200),
            checkSwitch.centerYAnchor.constraint(equalTo: customCell[2].centerYAnchor),
            checkSwitch.trailingAnchor.constraint(equalTo: customCell[2].trailingAnchor, constant: -24),
        ])
        

       // Сell 4
    
        // MARK: Colors Stack
        for button in checkBoxColors {
            button.widthAnchor.constraint(equalToConstant: 34).isActive = true
            button.heightAnchor.constraint(equalToConstant: 34).isActive = true
        }
        
        NSLayoutConstraint.activate([
            
            colorLabel.leadingAnchor.constraint(equalTo: customCell[3].leadingAnchor, constant: 16),
            colorLabel.heightAnchor.constraint(equalToConstant: 45),
            colorLabel.widthAnchor.constraint(equalToConstant: 55),
            colorLabel.topAnchor.constraint(equalTo: customCell[3].topAnchor,constant: 24),
            colorLabel.centerYAnchor.constraint(equalTo: customCell[3].centerYAnchor),
            colorRowStackView.topAnchor.constraint(equalTo: customCell[3].topAnchor, constant: 24),
            colorRowStackView.trailingAnchor.constraint(equalTo: customCell[3].trailingAnchor, constant: -16),

            
            colorSecondRowStackView.topAnchor.constraint(equalTo: colorRowStackView.bottomAnchor, constant: 8),
            colorSecondRowStackView.centerXAnchor.constraint(equalTo: colorRowStackView.centerXAnchor)
        ])
        
        // сell 5
        NSLayoutConstraint.activate([
            sizeLetterLabel.leadingAnchor.constraint(equalTo: customCell[4].leadingAnchor, constant: 16),
            sizeLetterLabel.topAnchor.constraint(equalTo: customCell[4].topAnchor,constant: 24),
            sizeLetterLabel.centerYAnchor.constraint(equalTo: customCell[4].centerYAnchor),
            
            stepper.centerYAnchor.constraint(equalTo: customCell[4].centerYAnchor),
            stepper.trailingAnchor.constraint(equalTo: customCell[4].trailingAnchor, constant: -64),
            
            exSizeLabel.centerYAnchor.constraint(equalTo: customCell[4].centerYAnchor),
            exSizeLabel.trailingAnchor.constraint(equalTo: customCell[4].trailingAnchor, constant: -16)
        ])
        
        // cell 6
        
        NSLayoutConstraint.activate([
            bgSwitch.centerYAnchor.constraint(equalTo: customCell[5].centerYAnchor),
            bgSwitch.trailingAnchor.constraint(equalTo: customCell[5].trailingAnchor, constant: -24),
            
            wordBgLabel.leadingAnchor.constraint(equalTo: customCell[5].leadingAnchor, constant: 16),
            wordBgLabel.heightAnchor.constraint(equalToConstant: 45),
            wordBgLabel.widthAnchor.constraint(equalToConstant: 230),
            wordBgLabel.topAnchor.constraint(equalTo: customCell[5].topAnchor,constant: 24),
            wordBgLabel.centerYAnchor.constraint(equalTo: customCell[5].centerYAnchor),
        ])
        // cell 7
        NSLayoutConstraint.activate([
            bgColorLabel.topAnchor.constraint(equalTo: customCell[6].topAnchor, constant: 24),
            bgColorLabel.leadingAnchor.constraint(equalTo: customCell[6].leadingAnchor, constant: 16),
            
            bgControl.bottomAnchor.constraint(equalTo: customCell[6].bottomAnchor, constant: -16),
            bgControl.leadingAnchor.constraint(equalTo: customCell[6].leadingAnchor, constant: 16),
            bgControl.trailingAnchor.constraint(equalTo: customCell[6].trailingAnchor, constant: -16)])
        // cell 8
        NSLayoutConstraint.activate([
            positionLabel.topAnchor.constraint(equalTo: customCell[7].topAnchor, constant: 24),
            positionLabel.leadingAnchor.constraint(equalTo: customCell[7].leadingAnchor, constant: 16),
            
            positionControl.bottomAnchor.constraint(equalTo: customCell[7].bottomAnchor, constant: -16),
            positionControl.leadingAnchor.constraint(equalTo: customCell[7].leadingAnchor, constant: 16),
            positionControl.trailingAnchor.constraint(equalTo: customCell[7].trailingAnchor, constant: -16)])
    
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)])
    
        for cell in customCell {
            cell.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16).isActive = true
            cell.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -16).isActive = true
            cell.heightAnchor.constraint(equalToConstant: 120).isActive = true
        }
    }
}
