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
        setupImageCell()
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
    var fotoImage1: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
        foto.image = UIImage(named: "1")
       return foto
    }()
    var fotoImage2: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
        foto.image = UIImage(named: "2")
       return foto
    }()
    var fotoImage3: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
        foto.image = UIImage(named: "3")
       return foto
    }()
    var fotoImage4: UIImageView = {
        var foto = UIImageView()
        foto.translatesAutoresizingMaskIntoConstraints = false
        foto.layer.cornerRadius = 6
        foto.clipsToBounds = true
        foto.contentMode = .scaleAspectFit
        foto.image = UIImage(named: "4")
       return foto
    }()
    
    var fotoLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var galleryButton: UIButton = {
        var button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "chevron.right"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    var verticalStack: UIStackView = {
//       var stack = UIStackView()
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
//        stack.spacing = 8
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
    
    
    func setupImageCell() {
        self.contentView.addSubview(backView)
//        self.backView.addSubview(fotoImage1)
//        self.backView.addSubview(fotoImage2)
//        self.backView.addSubview(fotoImage3)
//        self.backView.addSubview(fotoImage4)
//        self.backView.addSubview(fotoLabel)
//        self.backView.addSubview(galleryButton)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        
        
        
        
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
}
