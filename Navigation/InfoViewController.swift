//
//  InfoViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 19.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var myButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        myButton.setTitle("Press me", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = UIColor.blue
        myButton.layer.cornerRadius = 25
        myButton.frame = CGRect(x: 150, y: 400, width: 100, height: 50)
        myButton.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        self.view.addSubview(myButton)
        
    }
    
    @objc func buttonPress () {
        let alert = UIAlertController(title: "Внимание следуйте инструкции", message: "Нажмите на ОK", preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "ОK", style: .default) { (action) in
            print("У вас все получилось!")
        }
        let action2 = UIAlertAction(title: "Отмена", style: .destructive) { (action2) in
            print("Попробуйте еще раз!")
        }
        alert.addAction(action)
        alert.addAction(action2)
        self.present(alert, animated: true, completion: nil)
    }
}
