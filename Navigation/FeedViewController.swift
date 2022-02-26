//
//  FeedViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Лента"
        view.backgroundColor = .white
        
        button = UIButton(type: .roundedRect)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        button.center = view.center
        button.setTitle("Go!", for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 35
        button.addTarget(self, action: #selector(buttonPost), for: .touchUpInside)
        self.view.addSubview(self.button)
        
    }
    @objc func buttonPost (sender: Any) {
            let pushedVC = PostViewController()
            pushedVC.post = Post(title: "Контент")
            self.navigationController?.pushViewController(pushedVC, animated: true)
        }
    
}
