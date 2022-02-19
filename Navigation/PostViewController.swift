//
//  PostViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Заголовок"
        self.view.backgroundColor = UIColor.cyan
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newController(param:)))
        
    }
    
    @objc func newController(param: UIBarButtonItem) {
        self.navigationController?.present(InfoViewController(), animated: true, completion: nil)
    }
}
