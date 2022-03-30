//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 24.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PhotosCollectionViewCell"
    
    private let photoImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
        setupGalleryPhoto()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGalleryPhoto() {
        
        let topConstraint = self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8)
        let leadingConstraint = self.photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8)
        let trailingConstraint = self.photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        let bottomConstraint = self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        
        NSLayoutConstraint.activate([topConstraint, leadingConstraint, trailingConstraint, bottomConstraint])
    }
    func configure(with text: String) {
        photoImage.image = UIImage(named: text)
    }

}
