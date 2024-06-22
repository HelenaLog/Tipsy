

import UIKit

class ResultViewController: UIViewController {
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8431372549, green: 0.9764705882, blue: 0.9215686275, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "100.0"
        label.textColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        label.font = .systemFont(ofSize: 45, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let totalPerPersonLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Recalculate", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.backgroundColor = #colorLiteral(red: 0, green: 0.6901960784, blue: 0.4196078431, alpha: 1)
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(recalculatePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 people, with 10% tip."
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        backgroundView.addSubview(totalLabel)
        backgroundView.addSubview(totalPerPersonLabel)
        view.addSubview(settingsLabel)
        view.addSubview(recalculateButton)
        setConstraints()
    }
    
    @objc func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

}

extension ResultViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: settingsLabel.topAnchor, constant: -5),
            backgroundView.heightAnchor.constraint(equalToConstant: 300),
            
            totalPerPersonLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            totalPerPersonLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            totalPerPersonLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            totalPerPersonLabel.heightAnchor.constraint(equalToConstant: 35),
            totalPerPersonLabel.bottomAnchor.constraint(equalTo: totalLabel.topAnchor),
            
            totalLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
            totalLabel.heightAnchor.constraint(equalToConstant: 100),
            
            settingsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            settingsLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            settingsLabel.heightAnchor.constraint(equalToConstant: 117),
           
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
            recalculateButton.heightAnchor.constraint(equalToConstant: 54),
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
