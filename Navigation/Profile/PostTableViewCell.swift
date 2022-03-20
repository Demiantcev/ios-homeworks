//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 16.03.2022.
//
import UIKit

class PostTableViewCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    struct ModelPost: ViewModelProtocol {
        let author: String
        let image: String
        let text: String
        let likes: Int
        let views: Int
    }
    
    var backView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var imagePost: UIImageView = {
        var image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.setContentCompressionResistancePriority(UILayoutPriority(1000), for: .vertical)
        image.backgroundColor = .black
        image.image = UIImage()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var textPost: UILabel = {
        var label = UILabel()
        label.setContentCompressionResistancePriority(UILayoutPriority(750), for: .vertical)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .vertical)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var authorPost: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .vertical)
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var likeLabel: UILabel = {
        var label = UILabel()
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.text = "Likes: "
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var viewsLabel: UILabel = {
        var label = UILabel()
        label.setContentCompressionResistancePriority(UILayoutPriority(250), for: .horizontal)
        label.setContentHuggingPriority(UILayoutPriority(1), for: .horizontal)
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setup() {
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(backView)
        self.backView.addSubview(authorPost)
        self.backView.addSubview(imagePost)
        self.backView.addSubview(textPost)
        self.backView.addSubview(likeLabel)
        self.backView.addSubview(viewsLabel)
        
        let backViewConstraint = self.viewConstraint()
        NSLayoutConstraint.activate(backViewConstraint)
        
        let authorTopConstraint = self.authorPost.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let authorLeadingConstraint = self.authorPost.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let authorTrailingConstraint = self.authorPost.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let authorBottomConstraint = self.authorPost.bottomAnchor.constraint(equalTo: self.imagePost.topAnchor, constant: -12)
        
        let imageLeadingConstraint = self.imagePost.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let imageTrailingConstraint = self.imagePost.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let imageBottomConstraint = self.imagePost.bottomAnchor.constraint(equalTo: self.textPost.topAnchor,constant: -12)
        let imageHeightConstraint = self.imagePost.heightAnchor.constraint(equalTo: self.backView.widthAnchor)
        
        let textLeadingConstraint = self.textPost.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let textTrailingConstraint = self.textPost.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let textBottomConstraint = self.textPost.bottomAnchor.constraint(equalTo: self.likeLabel.topAnchor, constant: -16)
        
        let likeLeadingConstraint = self.likeLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let likeBottonConstraint = self.likeLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        
        let viewsTopConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.likeLabel.topAnchor)
        let viewsTrailingConstraint = self.viewsLabel.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor,constant: -16)
        let viewsBottonConstraint = self.viewsLabel.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        NSLayoutConstraint.activate([imageLeadingConstraint, imageTrailingConstraint, imageHeightConstraint, authorTopConstraint, authorBottomConstraint, authorLeadingConstraint, authorTrailingConstraint, textLeadingConstraint, textTrailingConstraint, textBottomConstraint, viewsTopConstraint, likeLeadingConstraint, imageBottomConstraint, viewsTrailingConstraint, viewsBottonConstraint, likeBottonConstraint
                                    ])
    }
    
    func viewConstraint() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraint]
    }
}
extension PostTableViewCell: Setupable {
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ModelPost else {return}

        self.authorPost.text = viewModel.author
        self.imagePost.image = UIImage(named: viewModel.image)
        self.textPost.text = viewModel.text
        self.likeLabel.text = "Likes: \(viewModel.likes)"
        self.viewsLabel.text = "Views: \(viewModel.views)"
    }
    
}

