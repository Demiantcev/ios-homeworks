//
//  LogInViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 10.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var buttonLogIn: UIButton = {
        var button = UIButton(type: .roundedRect)
        var color: UIImage = UIImage(named: "blue_pixel")!
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .init(patternImage: color)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(myProfile), for: .touchUpInside)
        return button
    }()
    @objc func myProfile (sender: Any) {
        let push = ProfileViewController()
        self.navigationController?.pushViewController(push, animated: true)
    }
    
    var vkImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "vk")
        return image
    }()
    
    var loginTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = .systemFont(ofSize: 16, weight: .light)
        text.autocapitalizationType = .none
        text.placeholder = "Email or phone"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        return text
    }()
    var passwordTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = .systemFont(ofSize: 16, weight: .light)
        text.autocapitalizationType = .none
        text.placeholder = "Password"
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.isSecureTextEntry = true
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        return text
    }()
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .systemGray6
        stackView.distribution = .fillProportionally
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var myScrollView: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        self.view.addSubview(self.myScrollView)
        self.myScrollView.addSubview(stackView)
        self.myScrollView.addSubview(buttonLogIn)
        self.myScrollView.addSubview(self.vkImage)
        self.stackView.addArrangedSubview(self.loginTextField)
        self.stackView.addArrangedSubview(self.passwordTextField)
        
        let scrollTopConstraint = self.myScrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let scrollLeftConstraint = self.myScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let scrollRightConstraint = self.myScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let scrollBottomConstraint = self.myScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        let imageTopConstraint = self.vkImage.topAnchor.constraint(equalTo: self.myScrollView.topAnchor, constant: 120)
        let imageXConstraint = self.vkImage.centerXAnchor.constraint(equalTo: self.myScrollView.centerXAnchor)
        let imageHeightConstrains = self.vkImage.heightAnchor.constraint(equalToConstant: 100)
        let imageWidthConstrains = self.vkImage.widthAnchor.constraint(equalToConstant: 100)
        
        let stackLeadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let stackTrailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let stackHeightConstraint = self.stackView.heightAnchor.constraint(equalToConstant: 100)
        let stackTopConstraint = self.stackView.topAnchor.constraint(equalTo: self.vkImage.bottomAnchor, constant: 120)
        
        let buttonTopConstraint = self.buttonLogIn.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let buttonHeightConstraint = self.buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        let buttonLeadingConstraint = self.buttonLogIn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.buttonLogIn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        
        
        NSLayoutConstraint.activate([
            imageWidthConstrains, imageHeightConstrains, imageXConstraint, imageTopConstraint, stackHeightConstraint, stackLeadingConstraint, stackTrailingConstraint, stackTopConstraint, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint, buttonHeightConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonTopConstraint
        ])
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = -100
        }
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) { (nc) in
            self.view.frame.origin.y = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
