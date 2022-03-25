//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 21.03.2022.
//


import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupImageCell()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var backView: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var fotoImage1: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
       return foto
    }()
    var fotoImage2: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
       return foto
    }()
    var fotoImage3: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
       return foto
    }()
    var fotoImage4: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
       return foto
    }()

    var fotoLabel: UILabel = {
        var label = UILabel()
        label.text = "Photos"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var galleryButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var horizontalStack: UIStackView = {
       var stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    func setupImageCell() {
        self.contentView.addSubview(backView)
        self.backView.addSubview(horizontalStack)
        self.horizontalStack.addArrangedSubview(fotoImage1)
        self.horizontalStack.addArrangedSubview(fotoImage2)
        self.horizontalStack.addArrangedSubview(fotoImage3)
        self.horizontalStack.addArrangedSubview(fotoImage4)
        self.backView.addSubview(fotoLabel)
        self.backView.addSubview(galleryButton)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        
        let fotoLabelTopConstraint = self.fotoLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let fotoLabelLeadingConstraint = self.fotoLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let fotoLabelTrailingConstraint = self.fotoLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let fotoLabelBottomConstraint = self.fotoLabel.bottomAnchor.constraint(equalTo: self.horizontalStack.topAnchor, constant: -12)
        
        let buttonCenterXConstraint = self.galleryButton.centerYAnchor.constraint(equalTo: self.fotoLabel.centerYAnchor)
        let buttonTrailingConstraint = self.galleryButton.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        
        let stackLeadingConstraint = self.horizontalStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let stackTrailingConstraint = self.horizontalStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let stackBottomConstraint = self.horizontalStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -12)
        let stackHeightConstraint = self.horizontalStack.heightAnchor.constraint(equalToConstant: 60)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint, fotoLabelTopConstraint, fotoLabelLeadingConstraint, fotoLabelTrailingConstraint,fotoLabelBottomConstraint, stackBottomConstraint, stackLeadingConstraint, stackTrailingConstraint, stackHeightConstraint, buttonCenterXConstraint, buttonTrailingConstraint])
    }
    func cellConfigure(with text: String) {
        fotoImage1.image = UIImage(named: text)
        fotoImage2.image = UIImage(named: text)
        fotoImage3.image = UIImage(named: text)
        fotoImage4.image = UIImage(named: text)
    }
}
