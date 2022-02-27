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
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Профиль"
        
        
        self.view.addSubview(self.headerView)
        
        
                }

    
    
override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    self.headerView.frame = view.frame
    
 
        
        
    }
}
