//
//  GestureRecognizerView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 02.05.2022.
//

import UIKit

class GestureView: UIViewController {
    
    private var imageWidthConstraint: NSLayoutConstraint?
    private var imageHeightConstraint: NSLayoutConstraint?
    private var imageTopConstraint: NSLayoutConstraint?
    private var imageLeadingConstraint: NSLayoutConstraint?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black.withAlphaComponent(0.0)
        setupConstraint()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        increaseFoto()
    }
    
    private func setupConstraint() {
        self.view.addSubview(fotoImage)
        self.view.addSubview(cancelButton)
        
        self.imageWidthConstraint = self.fotoImage.widthAnchor.constraint(equalToConstant: 140)
        self.imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalToConstant: 140)
        self.imageTopConstraint = self.fotoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.imageLeadingConstraint = self.fotoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        
        let topButtonConstraint = self.cancelButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        let trailingButtonConstraint = self.cancelButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightButtonConstraint = self.cancelButton.heightAnchor.constraint(equalToConstant: 40)
        let widthButtonConstraint = self.cancelButton.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([
            topButtonConstraint, trailingButtonConstraint,
            heightButtonConstraint, widthButtonConstraint,
            self.imageWidthConstraint, self.imageHeightConstraint,
            self.imageTopConstraint, self.imageLeadingConstraint
        ].compactMap( {$0} ))
    }
    
    private func increaseFoto() {
        NSLayoutConstraint.deactivate([
            self.imageTopConstraint, self.imageLeadingConstraint,
            self.imageWidthConstraint, self.imageHeightConstraint
        ].compactMap( {$0} ))
        
        self.imageWidthConstraint = self.fotoImage.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        self.imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalTo: self.view.widthAnchor)
        self.imageTopConstraint = self.fotoImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        self.imageLeadingConstraint = self.fotoImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        
        NSLayoutConstraint.activate([
            self.imageTopConstraint, self.imageLeadingConstraint,
            self.imageWidthConstraint, self.imageHeightConstraint
        ].compactMap( {$0} ))
        self.view.backgroundColor = .black.withAlphaComponent(0.8)
        
        UIView.animate(withDuration: 0.5, animations: {
            self.fotoImage.layer.cornerRadius = self.view.frame.width / 2
            self.view.layoutIfNeeded()
        }) { _ in
            self.cancelButton.alpha = 1
            self.fotoImage.layer.cornerRadius = 0
            
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    private func decreaseFoto() {
        NSLayoutConstraint.deactivate([
            self.imageTopConstraint, self.imageLeadingConstraint,
            self.imageWidthConstraint, self.imageHeightConstraint
        ].compactMap( {$0} ))
        
        self.imageWidthConstraint = self.fotoImage.widthAnchor.constraint(equalToConstant: 140)
        self.imageHeightConstraint = self.fotoImage.heightAnchor.constraint(equalToConstant: 140)
        self.imageTopConstraint = self.fotoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        self.imageLeadingConstraint = self.fotoImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        
        NSLayoutConstraint.activate([
            self.imageTopConstraint, self.imageLeadingConstraint,
            self.imageWidthConstraint, self.imageHeightConstraint
        ].compactMap( {$0} ))
        
        self.view.backgroundColor = .black.withAlphaComponent(0.8)
        self.cancelButton.alpha = 0.0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.fotoImage.layer.cornerRadius = 70
            self.view.layoutIfNeeded()
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    
    @objc private func cancel() {
        decreaseFoto()
    }
}
