//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 24.03.2022.
//

import UIKit

protocol ImageZoomable {
    func performZoomInForImageView(_ imageView: UIImageView)
}

class PhotosCollectionViewCell: UICollectionViewCell {
    
    var delegate: ImageZoomable?
    let tapGestureRecognizer = UITapGestureRecognizer()
    
    static let identifier = "PhotosCollectionViewCell"
    
    private var photoImage: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var topConstraint: NSLayoutConstraint?
    private var leadingConstraint: NSLayoutConstraint?
    private var trailingConstraint: NSLayoutConstraint?
    private var bottomConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photoImage)
        setupGalleryPhoto()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupGalleryPhoto() {
        
        self.topConstraint = self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8)
        self.leadingConstraint = self.photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8)
        self.trailingConstraint = self.photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8)
        self.bottomConstraint = self.photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8)
        
        NSLayoutConstraint.activate([self.topConstraint, self.leadingConstraint, self.trailingConstraint, self.bottomConstraint].compactMap({ $0 }))
    }
    func configure(with text: String) {
        photoImage.image = UIImage(named: text)
    }
    private func setupGesture() {
        self.photoImage.addGestureRecognizer(self.tapGestureRecognizer)
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.tapGesture))
        self.tapGestureRecognizer.view?.isUserInteractionEnabled = true
    }
    
    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        if let imageView = gestureRecognizer.view as? UIImageView {
            delegate?.performZoomInForImageView(imageView)
        }
    }
}

