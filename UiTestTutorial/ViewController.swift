//
//  ViewController.swift
//  UiTestTutorial
//
//  Created by Alyona Bedrosova on 22.07.2023.

import UIKit

class ViewController: UIViewController {
    
    private let stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private var button1: UIButton! = nil
    private var button2: UIButton! = nil
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type your text"
        textField.backgroundColor = .orange
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        button1 = makeButton(text: "Button one")
        button2 = makeButton(text: "Button two")
        
        button1.accessibilityIdentifier = "button1"
        
        button1.addTarget(self, action: #selector(buttonOneTapped), for: .touchUpInside)
        
        makeLayout()
    }
    
    @objc
    private func buttonOneTapped() {
        button1.configuration?.title = "Button tapped"
    }
    
    private func makeLayout() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(textField)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func makeButton(text: String) -> UIButton {
        var configuration = UIButton.Configuration.filled()
        configuration.title = text
        let button = UIButton(configuration: configuration)
        return button
    }

}

