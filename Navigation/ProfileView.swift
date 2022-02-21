//
//  ProfileView.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 13.02.2022.
//

import UIKit

class ProfileView: UIView {
    @IBOutlet weak var fotoImage: UIImageView!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var wordText: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupView()
    }
    func loadViewFromXib() -> UIView {
        guard let view = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView else { return UIView() }
        
        return view
    }
    
    private func setupView() {
        let view = self.loadViewFromXib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        self.addSubview(view)
    }
}
