//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 25.02.2022.
//


import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.backgroundColor = .systemGray4
        self.addSubview(showButton)
        self.addSubview(showLabel)
        self.addSubview(nameLabel)
        self.addSubview(fotoImage)
        
        let nameLabelTopConstraint = self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let nameLabelLeadingConstraint = self.nameLabel.leadingAnchor.constraint(equalTo: self.fotoImage.trailingAnchor, constant: 25)
        let nameLabelTrailingConstraint = self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        
        
        let buttonTopConstraint = self.showButton.topAnchor.constraint(equalTo: self.fotoImage.bottomAnchor, constant: 16)
        let buttonLeadingConstraint = self.showButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let buttonTrailingConstraint = self.showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let buttonHeightConstraint = self.showButton.heightAnchor.constraint(equalToConstant: 50)
        
        let imageTopConstraint = self.fotoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let imageLeadingConstraint = self.fotoImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalToConstant: 140)
        let imageWeightConstraint = self.fotoImage.widthAnchor.constraint(equalToConstant: 140)
       
        
        let showLabelLeadingConstraint = self.showLabel.leadingAnchor.constraint(equalTo: self.fotoImage.trailingAnchor, constant: 25)
        let showLabelBottomAnchor = self.showLabel.bottomAnchor.constraint(equalTo: self.showButton.bottomAnchor, constant: 34)
        let showLabelTopConstraint = self.showLabel.topAnchor.constraint(equalTo: self.topAnchor)
        
        NSLayoutConstraint.activate([
            nameLabelTopConstraint, nameLabelTrailingConstraint, buttonLeadingConstraint, buttonTrailingConstraint, imageTopConstraint, imageLeadingConstraint, showLabelBottomAnchor, showLabelLeadingConstraint,  buttonHeightConstraint, showLabelTopConstraint, nameLabelLeadingConstraint, buttonTopConstraint, imageHeightConstraint, imageWeightConstraint
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
        print("\(showLabel.text!)")
    }
    
    var showLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.text = "Think about it"
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
    


}

