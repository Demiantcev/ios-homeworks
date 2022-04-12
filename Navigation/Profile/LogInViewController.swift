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
        text.layer.cornerRadius = 7
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
        text.layer.cornerRadius = 7
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
        stackView.distribution = .fillEqually
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
    
    private lazy var loginBorder: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    private lazy var passwordBorder: UITextField = {
        let textField = UITextField()
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    @objc func myProfile (sender: Any) {

                if loginTextField.text == "" && passwordTextField.text == "" {
                    passwordBorder.backgroundColor = .red
                    passwordBorder.layer.cornerRadius = 10
                    UIView.animate(withDuration: 1, delay: 0) {
                        self.passwordBorder.backgroundColor = .clear
                    }
                    loginBorder.backgroundColor = .red
                    loginBorder.layer.cornerRadius = 10
                    UIView.animate(withDuration: 1, delay: 0) {
                        self.loginBorder.backgroundColor = .clear
                    }
                } else if passwordTextField.text == "" {
                    passwordBorder.backgroundColor = .red
                    passwordBorder.layer.cornerRadius = 10
                    UIView.animate(withDuration: 1, delay: 0) {
                        self.passwordBorder.backgroundColor = .clear
                    }
                } else if loginTextField.text == "" {
                    loginBorder.backgroundColor = .red
                    loginBorder.layer.cornerRadius = 10
                    UIView.animate(withDuration: 1, delay: 0) {
                        self.loginBorder.backgroundColor = .clear
                    }
                }
                if passwordTextField.text?.count != minLength {
                    message.alpha = 1
                    UIView.animate(withDuration: 5, delay: 0) {
                        self.message.alpha = 0
                        self.message.text = "Пароль должен состоять из 6 символов!"
                    }
                } else {
                    message.text = ""
                }
                alertLoginPassword()
    }
    
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
        self.passwordBorder.addSubview(passwordTextField)
        self.loginBorder.addSubview(loginTextField)
        self.stackView.addArrangedSubview(self.loginBorder)
        self.stackView.addArrangedSubview(self.passwordBorder)
        
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
        
        let loginTopConstraint = loginTextField.topAnchor.constraint(equalTo: loginBorder.topAnchor)
        let loginBottomConstraint = loginTextField.bottomAnchor.constraint(equalTo: loginBorder.bottomAnchor)
        let loginTrailingConstraint = loginTextField.trailingAnchor.constraint(equalTo: loginBorder.trailingAnchor, constant: -5)
        let loginLeadingConstraint = loginTextField.leadingAnchor.constraint(equalTo: loginBorder.leadingAnchor, constant: 5)
        
        let passwordTopConstraint = passwordTextField.topAnchor.constraint(equalTo: passwordBorder.topAnchor)
        let passwordBottomConstraint = passwordTextField.bottomAnchor.constraint(equalTo: passwordBorder.bottomAnchor)
        let passwordTrailingConstraint = passwordTextField.trailingAnchor.constraint(equalTo: passwordBorder.trailingAnchor, constant: -5)
        let passwordLeadingConstraint = passwordTextField.leadingAnchor.constraint(equalTo: passwordBorder.leadingAnchor, constant: 5)
        
        let buttonTopConstraint = self.buttonLogIn.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        let buttonHeightConstraint = self.buttonLogIn.heightAnchor.constraint(equalToConstant: 50)
        let buttonLeadingConstraint = self.buttonLogIn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.buttonLogIn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        
        let labelTopConstraint = self.message.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 1)
        let labelLeadingConstraint = self.message.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let labelBottomConstraint = self.message.bottomAnchor.constraint(equalTo: self.buttonLogIn.topAnchor, constant: -1)
        
        
        NSLayoutConstraint.activate([
            imageWidthConstrains, imageHeightConstrains, imageXConstraint, imageTopConstraint, stackHeightConstraint, stackLeadingConstraint, stackTrailingConstraint, scrollTopConstraint, scrollLeftConstraint, scrollRightConstraint, scrollBottomConstraint, buttonHeightConstraint, buttonLeadingConstraint, buttonTrailingConstraint, buttonTopConstraint, stackCenterXConstraint, stackCenterYConstraint, labelTopConstraint, labelLeadingConstraint, labelBottomConstraint, loginTopConstraint, loginLeadingConstraint, loginBottomConstraint, loginTrailingConstraint, passwordTopConstraint, passwordBottomConstraint, passwordLeadingConstraint, passwordTrailingConstraint
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

