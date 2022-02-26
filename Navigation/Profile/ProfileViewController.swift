//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var headerView = ProfileHeaderView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Профиль"
        
        view.addSubview(headerView)
        
    }
    
    override func viewDidLayoutSubviews() {
        self.headerView.frame = self.view.frame
    }
}
