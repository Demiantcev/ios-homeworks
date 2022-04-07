//
//  DetailView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 04.04.2022.
//
import UIKit

class DetailViewController: UIViewController {
    
    struct ModelPostNews: ViewModelProtocol {
        let author: String
        let image: String
        let text: String
    }
    var postDetail = postProfile
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        self.view.addSubview(authorPost)
        self.view.addSubview(imagePost)
        self.view.addSubview(textPost)

        let nameLabelTopConstraint = self.authorPost.topAnchor.constraint(equalTo: view.topAnchor, constant: 10)
        let nameLabelLeadingConstraint = self.authorPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        let nameLabelTrailingConstraint = self.authorPost.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let nameLabelBottomConstraint = self.authorPost.bottomAnchor.constraint(equalTo: self.imagePost.topAnchor, constant: -10)
        
        let imageLeadingConstraint = self.imagePost.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let imageTrailingConstraint = self.imagePost.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        let imageHeightConstraint = self.imagePost.heightAnchor.constraint(equalTo: self.view.widthAnchor)
        let imageBottomConstraint = self.imagePost.bottomAnchor.constraint(equalTo: self.textPost.topAnchor, constant: 150)
        
        let textLeadingConstraint = self.textPost.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        let textTrailingConstraint = self.textPost.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        let textBottomConstraint = self.textPost.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        NSLayoutConstraint.activate([nameLabelTopConstraint, nameLabelLeadingConstraint, nameLabelTrailingConstraint, imageLeadingConstraint, imageTrailingConstraint, imageHeightConstraint, textBottomConstraint, textLeadingConstraint, textTrailingConstraint, imageHeightConstraint,nameLabelBottomConstraint, imageBottomConstraint
                                    ])
    }
    
    func setup(_ model: ModelPostNews) {
        self.authorPost.text = model.author
        self.imagePost.image = UIImage(named: model.image)
        self.textPost.text = model.text
    }
}
