//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 21.03.2022.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var myPhotos = ["1", "2", "3", "4", "5",
                            "6", "7", "8", "9", "10",
                            "11", "12", "13", "14", "15",
                            "16", "17", "18", "19", "20"
    ]
    var backView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var fotoImage: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
        foto.image = UIImage(named: "1")
       return foto
    }()
    
    var fotoLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var galleryButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var verticalStack: UIStackView = {
       var stack = UIStackView()
        stack.axis = .horizontal
        return stack
    }()
    
    
    func setupImageCell() {
        self.contentView.addSubview(backView)
        self.backView.addSubview(fotoImage)
        self.backView.addSubview(fotoLabel)
        self.backView.addSubview(galleryButton)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        
        let fotoLabelTopConstraint = self.fotoLabel.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let fotoLabelLeadingConstraint = self.fotoLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let fotoLabelTrailingConstraint = self.fotoLabel.trailingAnchor.constraint(equalTo: self.galleryButton.leadingAnchor)
        let fotoLabelBottomConstraint = self.fotoLabel.bottomAnchor.constraint(equalTo: self.fotoImage.topAnchor, constant: 12)
        
        
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint, fotoLabelTopConstraint, fotoLabelBottomConstraint, fotoLabelLeadingConstraint, fotoLabelTrailingConstraint])
    }
}
