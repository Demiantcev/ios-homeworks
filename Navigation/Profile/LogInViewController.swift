//
//  LogInViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 10.03.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private let minLength = 6
    private let login = "user@mail.ru"
    private let password = "123456"
    
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
        
//        if loginTextField.text == "" && passwordTextField.text == "" {
//            passwordTextField.backgroundColor = .red
//            passwordTextField.layer.cornerRadius = 10
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.passwordTextField.backgroundColor = .clear
//            }
//            loginTextField.backgroundColor = .red
//            loginTextField.layer.cornerRadius = 10
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.loginTextField.backgroundColor = .clear
//            }
//        } else if passwordTextField.text == "" {
//            passwordTextField.backgroundColor = .red
//            passwordTextField.layer.cornerRadius = 10
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.passwordTextField.backgroundColor = .clear
//            }
//        } else if loginTextField.text == "" {
//            loginTextField.backgroundColor = .red
//            loginTextField.layer.cornerRadius = 10
//            UIView.animate(withDuration: 1, delay: 0) {
//                self.loginTextField.backgroundColor = .clear
//            }
//        }
//        if passwordTextField.text?.count != minLength {
//            message.alpha = 1
//            UIView.animate(withDuration: 3, delay: 0) {
//                self.message.alpha = 0
//                self.message.text = "Пароль должен состоять из 6 символов!"
//            }
//        } else {
//            message.text = ""
//        }
//        alertLoginPassword()
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
        text.placeholder = "Email or phone:"
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
        text.placeholder = "Password:"
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
    
    private lazy var message: UILabel = {
        var message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.textColor = .red
        message.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        message.numberOfLines = 0
        return message
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.registerForKeyboardNotifications()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        self.view.addSubview(self.myScrollView)
        self.myScrollView.addSubview(self.stackView)
        self.myScrollView.addSubview(self.buttonLogIn)
        self.myScrollView.addSubview(self.vkImage)
        self.myScrollView.addSubview(self.message)
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
        let stackCenterXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.myScrollView.centerXAnchor)
        let stackCenterYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.myScrollView.centerYAnchor)
        
        let buttonTopConstraint = self.buttonLogIn.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let buttonHeightConstraint = self.buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        let buttonLeadingConstraint = self.buttonLogIn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.buttonLogIn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        
        let labelTopConstraint = self.message.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 1)
        let labelLeadingConstraint = self.message.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let labelBottomConstraint = self.message.bottomAnchor.constraint(equalTo: self.buttonLogIn.topAnchor, constant: -1)
        
        
        NSLayoutConstraint.activate([
            imageWidthConstrains, imageHeightConstrains, imageXConstraint, imageTopConstraint, stackHeightConstraint, stackLeadingConstraint, stackTrailingConstraint, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint, buttonHeightConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonTopConstraint, stackCenterXConstraint, stackCenterYConstraint, labelTopConstraint, labelLeadingConstraint, labelBottomConstraint
        ])
    }
    
    func alertLoginPassword() {
        let push = ProfileViewController()
        if loginTextField.text != login && passwordTextField.text != password {
            let alert = UIAlertController(title: "Некорректный ввод", message: "Логин: \(login)\nПароль: \(password)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Oк", style: .cancel)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else if loginTextField.text != login {
            let loginAlert = UIAlertController(title: "Некорректный ввод", message: "Логин: \(login)", preferredStyle: .alert)
            let loginAction = UIAlertAction(title: "Oк", style: .cancel)
            loginAlert.addAction(loginAction)
            self.present(loginAlert, animated: true, completion: nil)
        } else if passwordTextField.text != password {
            let passwordAlert = UIAlertController(title: "Некорректный ввод", message: "Пароль: \(password)", preferredStyle: .alert)
            let passwordAction = UIAlertAction(title: "Oк", style: .cancel)
            passwordAlert.addAction(passwordAction)
            self.present(passwordAlert, animated: true, completion: nil)
        } else {
            self.navigationController?.pushViewController(push, animated: true)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbShow), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func kbShow (notification: NSNotification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let loginButtonBottomPointY = self.buttonLogIn.frame.origin.y + 50
            let keyboardOriginY = self.view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0
            
            self.myScrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
}

