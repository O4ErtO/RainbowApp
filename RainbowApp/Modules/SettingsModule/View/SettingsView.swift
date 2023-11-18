//
//  settingsView.swift
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func sliderChanged(sender: UISlider)
    func switchAction(sender: UISwitch)
    func didTapColorBox(sender: UITapGestureRecognizer)
    func stepperAction(sender: UIStepper)
    func changeBgColor(sender: UISegmentedControl)
    func wordPosition(sender: UISegmentedControl)
}

class SettingsView: UIView {

    // MARK: - Parameters
    weak var delegate: SettingsViewDelegate?
    var selectedColors:[Bool]?
    
    private lazy var mainStackView: UIStackView = {
        let element = UIStackView(
            axis: .vertical,
            distribution: .fillProportionally,
            subViews: customCell
        )
        element.spacing = 24
        element.alignment = .center
        return element
    }()
    
    private var scrollView: UIScrollView = {
        let element = UIScrollView()
        element.translatesAutoresizingMaskIntoConstraints = false
        element.showsVerticalScrollIndicator = false
        element.isScrollEnabled = true
        return element
    }()
    
    private var colorRowStackView = UIStackView()
    private var colorSecondRowStackView = UIStackView()
    
    var customCell = [SettingsCellView]()

    // cell 1
    private let gameTimeLabel = UILabel(text: SettingsLabel.gameTime)
    let timeSlider = UISlider(maxValue: 60, minValue: 5)
    lazy var timeSetLabel = UILabel(text: String(format: "%.0f", timeSlider.value) + " c")
    
    // cell 2
    private let speedLabel = UILabel(text: SettingsLabel.speed)
    let speedSlider = UISlider(maxValue: 15, minValue: 1)
    lazy var speedSetLabel = UILabel(text: String(format: "%.0f", speedSlider.value) + " c")
    
    // cell 3
    private let isCheckLabel = UILabel(text: SettingsLabel.check)
    let checkSwitch = UISwitch(isOn: true)
    
    // cell 4
    private let colorLabel = UILabel(text: SettingsLabel.letterColors)
    var checkBoxColors = [ColorboxView]()
    
    // cell 5
    private let sizeLetterLabel = UILabel(text: SettingsLabel.letterSize)
    let stepper = UIStepper(minValue: 12, maxValue: 36, value: 20)
    let exSizeLabel = UILabel(text: "Aa")
    
    // cell 6
    private let wordBgLabel = UILabel(text: SettingsLabel.letterBg)
    let bgSwitch = UISwitch(isOn: false)
    
    // cell7
    private let bgColorLabel = UILabel(text: SettingsLabel.bg)
    let bgControl = UISegmentedControl(
        items: ["Серый", "Белый", "Черный"],
        selectedIndex: 0
    )
    // cell 8
    private let positionLabel = UILabel(text: SettingsLabel.position)
    let positionControl = UISegmentedControl(
        items: ["Случайное", "По центру"],
        selectedIndex: 0
    )
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        setUpView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    @objc func sliderChanged (_ sender: UISlider) {
        delegate?.sliderChanged(sender: sender)
    }
    
    @objc func switchAction(sender: UISwitch) {
        delegate?.switchAction(sender: sender)
    }
    
    @objc func stepperAction(sender: UIStepper) {
        delegate?.stepperAction(sender: sender)
    }
    
    @objc func changeBgColor(_ sender: UISegmentedControl) {
        delegate?.changeBgColor(sender: sender)
    }
    
    @objc func wordPosition(_ sender: UISegmentedControl) {
        delegate?.wordPosition(sender: sender)
       
    }
    
    @objc func didTapColorbox(sender: UITapGestureRecognizer) {
        delegate?.didTapColorBox(sender: sender)
    }
    
    private func setUpView() {
        for _ in 0...7 {
            customCell.append(SettingsCellView())
        }
        addSubview(scrollView)
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
        
        for color in gameData.allColors {
            checkBoxColors.append(ColorboxView(color: color))
        }
        
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
            button.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapColorbox)))
        }
        
        customCell[4].addSubview(sizeLetterLabel)
        customCell[4].addSubview(stepper)
        customCell[4].addSubview(exSizeLabel)
        stepper.addTarget(self, action: #selector(stepperAction), for: .valueChanged)
        
        customCell[5].addSubview(wordBgLabel)
        customCell[5].addSubview(bgSwitch)
        bgSwitch.addTarget(self, action: #selector(switchAction), for: .valueChanged)
        
        customCell[6].addSubview(bgColorLabel)
        customCell[6].addSubview(bgControl)
        bgControl.addTarget(self, action: #selector(changeBgColor), for: .valueChanged)
        
        customCell[7].addSubview(positionLabel)
        customCell[7].addSubview(positionControl)
        positionControl.addTarget(self, action: #selector(wordPosition), for: .valueChanged)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
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
        for button in checkBoxColors {
            button.widthAnchor.constraint(equalToConstant: 34).isActive = true
            button.heightAnchor.constraint(equalToConstant: 34).isActive = true
        }
        NSLayoutConstraint.activate([
            colorLabel.leadingAnchor.constraint(equalTo: customCell[3].leadingAnchor, constant: 16),
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
