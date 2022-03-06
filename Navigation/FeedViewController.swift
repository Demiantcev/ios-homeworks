//
//  FeedViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    
    var button1: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setBackgroundImage(.init(systemName: "hands.sparkles.fill"), for: .normal)
        button.addTarget(self, action: #selector(buttonPost), for: .touchUpInside)
        return button
    }()
    var button2: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setBackgroundImage(.init(systemName: "hands.sparkles"), for: .normal)
        button.addTarget(self, action: #selector(buttonPost), for: .touchUpInside)
        return button
    }()
    @objc func buttonPost (sender: Any) {
        let pushedVC = PostViewController()
        pushedVC.post = Post(title: "Контент")
        self.navigationController?.pushViewController(pushedVC, animated: true)
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
        view.backgroundColor = .white
        
        self.view.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.button1)
        self.stackView.addArrangedSubview(self.button2)
        
        let buttonYCenter = self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let buttonXCenter = self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let buttonHeightConstraint = self.button1.heightAnchor.constraint(equalToConstant: 50)
        let buttonWidthConstraint = self.button1.widthAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            buttonXCenter, buttonYCenter, buttonWidthConstraint ,buttonHeightConstraint
        ])
        
    }
}
