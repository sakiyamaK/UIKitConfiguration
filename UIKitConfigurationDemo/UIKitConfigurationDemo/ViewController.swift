//
//  ViewController.swift
//  UIKitConfigurationDemo
//
//  Created by sakiyamaK on 2023/11/01.
//

import UIKit
import UIKitConfiguration

class ViewController: UIViewController {
    
    let labelConfiguration1: UILabel.UIKitConfiguration = {
        var configuration = UILabel.UIKitConfiguration()
        configuration[\.textColor] = .white
        configuration[\.font] = UIFont.systemFont(ofSize: 18, weight: .bold)
        configuration[\.numberOfLines] = 0
        configuration[\.backgroundColor] = .black

        return configuration
    }()

    lazy var demoLabel1: UILabel = {
        let label = UILabel(configuration: labelConfiguration1)
        label.text = "labelConfiguration1を適用したdemoLabel1です"
        return label
    }()

    lazy var demoLabel2: UILabel = {
        let label = UILabel(configuration: labelConfiguration1)
        label.text = "labelConfiguration1を適用したdemoLabel2です"
        return label
    }()

    let labelConfiguration2: UILabel.UIKitConfiguration = {
        var configuration = UILabel.UIKitConfiguration()
        configuration[\.textColor] = .systemRed
        configuration[\.font] = UIFont.systemFont(ofSize: 13, weight: .regular)
        configuration[\.numberOfLines] = 1
        configuration[\.backgroundColor] = .systemBlue

        return configuration
    }()

    lazy var demoLabel3: UILabel = {
        let label = UILabel(configuration: labelConfiguration2)
        label.text = "labelConfiguration2を適用したdemoLabel3です"
        return label
    }()

    lazy var demoLabel4: UILabel = {
        let label = UILabel(configuration: labelConfiguration2)
        label.text = "labelConfiguration2を適用したdemoLabel4です"
        return label
    }()
    
    let imageViewConfiguration: UIImageView.UIKitConfiguration = {
        var configuration = UIImageView.UIKitConfiguration()
        configuration[\.backgroundColor] = .black
        configuration[\.contentMode] = .scaleAspectFit
        configuration[\.image] = UIImage(systemName: "swift")
        return configuration
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupLayout()
    }
}

private extension ViewController {
    func setupLayout() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10

        self.view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])

        [demoLabel1, demoLabel2, demoLabel3, demoLabel4].forEach { label in
            stackView.addArrangedSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.heightAnchor.constraint(equalToConstant: 100),
            ])
        }
        
        let imageStackView = UIStackView()
        imageStackView.axis = .horizontal
        imageStackView.distribution = .fillEqually
        imageStackView.spacing = 10
        imageStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageStackView.heightAnchor.constraint(equalToConstant: 100),
        ])
        stackView.addArrangedSubview(imageStackView)

        (0...3).forEach { _ in
            imageStackView.addArrangedSubview(UIImageView(configuration: imageViewConfiguration))
        }

        stackView.addArrangedSubview(UIView())
    }
}

