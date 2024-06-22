

import UIKit

class CalculatorViewController: UIViewController {
    
    let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 26
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let billTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "e.g. 123.56"
        textField.font = .systemFont(ofSize: 40)
        textField.textAlignment = .center
        textField.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let tipsyView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let viewStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 25
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let selectTipLabel: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var zeroPercentButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitle("0%", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tenPercentButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitle("10%", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var twentyPercentButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.setTitle("20%", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose Split"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .natural
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stepperStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 27
        stackView.contentMode = .scaleToFill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let splitNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 35)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        label.text = "10"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 10
        stepper.maximumValue = 25
        stepper.minimumValue = 10
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.stepValue = 1
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .touchUpInside)
        return stepper
    }()
    
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .green
        button.titleLabel?.font = .systemFont(ofSize: 40)
        button.tintColor = .white
        button.contentMode = .scaleToFill
        button.layer.cornerRadius = 10
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var tip = 0.1
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        view.addSubview(topStackView)
        topStackView.addArrangedSubview(enterLabel)
        topStackView.addArrangedSubview(billTextField)
        view.addSubview(tipsyView)
        tipsyView.addSubview(viewStackView)
        viewStackView.addArrangedSubview(selectTipLabel)
        viewStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(zeroPercentButton)
        horizontalStackView.addArrangedSubview(tenPercentButton)
        horizontalStackView.addArrangedSubview(twentyPercentButton)
        viewStackView.addArrangedSubview(chooseSplitLabel)
        viewStackView.addArrangedSubview(stepperStackView)
        stepperStackView.addArrangedSubview(splitNumberLabel)
        stepperStackView.addArrangedSubview(stepper)
        view.addSubview(calculateButton)
    }
    
    @objc func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPersentSign = String(buttonTitle.dropLast())
        let buttonTitleAsNumber = Double(buttonTitleMinusPersentSign)!
        tip = buttonTitleAsNumber / 100
        
    }
    
    @objc func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @objc func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        let resultVC = ResultViewController()
        resultVC.totalLabel.text = finalResult
        resultVC.settingsLabel.text = "Split between \(numberOfPeople) people, with \(Int(tip * 100))% tip."
        self.present(resultVC, animated: true)
    }
}

//MARK: - Constraints

extension CalculatorViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topStackView.bottomAnchor.constraint(equalTo: tipsyView.topAnchor, constant: -40),
            
            enterLabel.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor, constant: -45),
            enterLabel.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor, constant: 45),
            enterLabel.heightAnchor.constraint(equalToConstant: 28),
            
            billTextField.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor),
            billTextField.leadingAnchor.constraint(equalTo: topStackView.leadingAnchor),
            billTextField.heightAnchor.constraint(equalToConstant: 48),
            
            tipsyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tipsyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tipsyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            viewStackView.leadingAnchor.constraint(equalTo: tipsyView.leadingAnchor, constant: 20),
            viewStackView.trailingAnchor.constraint(equalTo: tipsyView.trailingAnchor, constant: -20),
            viewStackView.topAnchor.constraint(equalTo: tipsyView.topAnchor, constant: 15),
            
            selectTipLabel.leadingAnchor.constraint(equalTo: viewStackView.leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: viewStackView.trailingAnchor, constant: -30),
            selectTipLabel.heightAnchor.constraint(equalToConstant: 25),
            
            horizontalStackView.leadingAnchor.constraint(equalTo: viewStackView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: viewStackView.trailingAnchor),
            
            zeroPercentButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 59),
            zeroPercentButton.heightAnchor.constraint(equalToConstant: 54),
            
            tenPercentButton.heightAnchor.constraint(equalToConstant: 54),
            twentyPercentButton.heightAnchor.constraint(equalToConstant: 54),
            
            chooseSplitLabel.leadingAnchor.constraint(equalTo: viewStackView.leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: viewStackView.trailingAnchor, constant: -30),
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 25),
            
            splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
            splitNumberLabel.widthAnchor.constraint(equalToConstant: 100),
            
            stepper.heightAnchor.constraint(equalToConstant: 29),
            stepper.widthAnchor.constraint(equalToConstant: 100),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
}
