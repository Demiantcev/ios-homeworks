//
//  GestureView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 26.03.2022.
//

import UIKit

class GestureView: UIViewController {
    
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
    var cancelButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "clear.fill"), for: .normal)
        button.alpha = 0
        button.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return button
    }()
    
    private var imageTopConstraint: NSLayoutConstraint?
    private var imageLeadingConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    private var imageWidthConstraint: NSLayoutConstraint?
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var isExpanded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(fotoImage)
        self.view.addSubview(cancelButton)
        self.setupConstraint()
        self.setupGesture()

        view.backgroundColor = .systemGray2
    }
    
    private func setupConstraint() {
        self.imageTopConstraint = self.fotoImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50)
        self.imageLeadingConstraint = self.fotoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        self.imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalToConstant: 140)
        self.imageWidthConstraint = self.fotoImage.widthAnchor.constraint(equalToConstant: 140)
        
        let topBottomConstraint = self.cancelButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let trailingBottomConstraint = self.cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightBottomConstraint = self.cancelButton.heightAnchor.constraint(equalToConstant: 40)
        let widthBottomConstraint = self.cancelButton.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([self.imageTopConstraint, self.imageLeadingConstraint, self.imageHeightConstraint, self.imageWidthConstraint, topBottomConstraint, trailingBottomConstraint, heightBottomConstraint, widthBottomConstraint].compactMap({ $0 }))
    }
    
    private func setupGesture() {
        self.fotoImage.addGestureRecognizer(self.tapGestureRecognizer)
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.tapGesture))
        self.tapGestureRecognizer.view?.isUserInteractionEnabled = true
    }
    
    @objc private func tapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        
        self.isExpanded.toggle()

        self.imageTopConstraint?.constant = self.isExpanded ? view.center.x : 50
        self.imageWidthConstraint?.constant = self.isExpanded ? view.frame.width : 140
        self.imageHeightConstraint?.constant = self.isExpanded ? view.frame.width : 140
        self.fotoImage.layer.cornerRadius = self.isExpanded ? 0 : 70
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded() }
    completion: { _ in

    }
        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.cancelButton.alpha = self.isExpanded ? 1 : 0
        }
    }
    @objc private func cancel(_ sender: Any) {
        tapGesture(tapGestureRecognizer)
        
    }
}
