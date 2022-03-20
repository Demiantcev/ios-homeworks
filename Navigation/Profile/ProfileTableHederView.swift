//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 14.03.2022.
//


import UIKit

class ProfileTableHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
        self.setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraint() {

        let topConstraint = self.topAnchor.constraint(equalTo: self.topAnchor)
        let leadingConstraint = self.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let trailingConstraint = self.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let heightConstraint = self.heightAnchor.constraint(equalToConstant: 265)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint
        ])
    }
    func setup() {
        
        self.statusTextField.delegate = self
        self.backgroundColor = .systemGray4
        self.addSubview(showButton)
        self.addSubview(showLabel)
        self.addSubview(nameLabel)
        self.addSubview(fotoImage)
        self.addSubview(statusTextField)
        
        let nameLabelTopConstraint = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let nameLabelLeadingConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: self.fotoImage.trailingAnchor, constant: 25)
        let nameLabelTrailingConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        let buttonLeadingConstraint = self.showButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.showButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonTopConstraint = self.showButton.topAnchor.constraint(equalTo: self.fotoImage.bottomAnchor, constant: 40)
        
        let imageTopConstraint = self.fotoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let imageLeadingConstraint = self.fotoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalToConstant: 140)
        let imageWeightConstraint = self.fotoImage.widthAnchor.constraint(equalToConstant: 140)
        
        let showLabelLeadingConstraint = self.showLabel.leadingAnchor.constraint(equalTo: self.fotoImage.trailingAnchor, constant: 25)
        let showLabelBottomAnchor = self.showLabel.bottomAnchor.constraint(equalTo: self.statusTextField.bottomAnchor, constant: 50)
        let showLabelTopConstraint = self.showLabel.topAnchor.constraint(equalTo: self.topAnchor)
        
        let textLeadingConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.showLabel.leadingAnchor)
        let textTrailingConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let textBottomConstraint = self.statusTextField.bottomAnchor.constraint(equalTo: self.showButton.topAnchor, constant: -15)
        let textHeightConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 40)
        
        
        NSLayoutConstraint.activate([
            nameLabelTopConstraint, nameLabelTrailingConstraint, buttonLeadingConstraint, buttonTrailingConstraint, imageTopConstraint, imageLeadingConstraint, showLabelBottomAnchor, showLabelLeadingConstraint,  buttonHeightConstraint, showLabelTopConstraint, nameLabelLeadingConstraint, imageHeightConstraint, imageWeightConstraint, buttonTopConstraint, textBottomConstraint, textLeadingConstraint, textTrailingConstraint, textHeightConstraint
        ])
    }
    
    var showButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .blue
        button.tintColor = .white
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = .init(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
        return button
    }()
    @objc func showStatus (sender: Any) {
        showLabel.text = statusText
    }
    
    var showLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    var fotoImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Фокси")
        image.layer.cornerRadius = 70
        image.clipsToBounds = true
        image.layer.borderWidth = 6
        image.layer.borderColor = UIColor.white.cgColor
        return image
    }()
    var nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Fox Dog"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    var statusTextField: UITextField = {
        var text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textColor = .black
        text.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        text.layer.cornerRadius = 12
        text.backgroundColor = .white
        text.layer.borderWidth = 1
        text.layer.borderColor = UIColor.black.cgColor
        text.textAlignment = .center
        text.placeholder = "Status..."
        text.clearButtonMode = .whileEditing
        text.clearButtonMode = .unlessEditing
        text.clearButtonMode = .always
        text.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return text
    }()
    
    private var statusText = String()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }
}
extension ProfileTableHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


