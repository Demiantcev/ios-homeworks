//
//  DetailView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 04.04.2022.
//
import UIKit

class DetailView: UIView {
    
    struct ModelPostNews: ViewModelProtocol {
        let author: String
        let image: String
        let text: String
        let like: Int
        let views: Int
    }
    var postDetail = postProfile
    var tapImage = UITapGestureRecognizer()
    
    var imagePost: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        image.image = UIImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    var textPost: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .light)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var authorPost: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var likeLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var viewsLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        setupPost()
        tapImageGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPost() {
        
        self.addSubview(authorPost)
        self.addSubview(imagePost)
        self.addSubview(textPost)
        self.addSubview(likeLabel)
        self.addSubview(viewsLabel)
        
        let nameLabelTopConstraint = self.authorPost.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10)
        let nameLabelLeadingConstraint = self.authorPost.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let nameLabelTrailingConstraint = self.authorPost.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let nameLabelBottomConstraint = self.authorPost.bottomAnchor.constraint(equalTo: self.imagePost.topAnchor, constant: -10)
        
        let imageLeadingConstraint = self.imagePost.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let imageTrailingConstraint = self.imagePost.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let imageHeightConstraint = self.imagePost.heightAnchor.constraint(equalTo: self.widthAnchor)
        let imageBottomConstraint = self.imagePost.bottomAnchor.constraint(equalTo: self.textPost.topAnchor, constant: 80)
        
        let textLeadingConstraint = self.textPost.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let textTrailingConstraint = self.textPost.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let textBottomConstraint = self.textPost.bottomAnchor.constraint(equalTo: self.likeLabel.topAnchor)
        
        let likeLeadingConstraint = self.likeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let likeBottonConstraint = self.likeLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        
        let viewsTopConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.likeLabel.topAnchor)
        let viewsTrailingConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16)
        let viewsBottomConstraint = self.viewsLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        
        NSLayoutConstraint.activate([nameLabelTopConstraint, nameLabelLeadingConstraint, nameLabelTrailingConstraint, imageLeadingConstraint, imageTrailingConstraint, textBottomConstraint, textLeadingConstraint, textTrailingConstraint,nameLabelBottomConstraint, imageBottomConstraint, imageHeightConstraint,
                                     likeBottonConstraint, likeLeadingConstraint, viewsTopConstraint, viewsBottomConstraint, viewsTrailingConstraint
                                    ])
    }
    private func tapImageGesture() {
        self.imagePost.addGestureRecognizer(tapImage)
        self.tapImage.view?.isUserInteractionEnabled = true
        self.tapImage.addTarget(self, action: #selector(backPostNews))
    }
    @objc func backPostNews(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapImage === gestureRecognizer else { return }
        self.removeFromSuperview()
    }
    
    func setup(_ model: ModelPostNews) {
        self.authorPost.text = model.author
        self.imagePost.image = UIImage(named: model.image)
        self.textPost.text = model.text
        self.likeLabel.text = "Likes: \(model.like)"
        self.viewsLabel.text = "Views: \(model.views)"
    }
}

