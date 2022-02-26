//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 25.02.2022.
//


import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var showStatusButton: UIButton!
    @IBOutlet weak var showStatusText: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var fotoImage: UIImageView!
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            self.setupView()
        }
        
        private func setupView() {
            let view = self.loadViewFromXib()
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }
        
        private func loadViewFromXib() -> UIView {
            guard let view = Bundle.main.loadNibNamed("HeaderView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
            
            return view
        }

    }
