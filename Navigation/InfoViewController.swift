//
//  InfoViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 19.02.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    var myButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(.init(systemName: "exclamationmark.circle.fill"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(InfoViewController.self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(myButton)
        
        let buttonYCenter = self.myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let buttonXCenter = self.myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let buttonHeightConstraint = self.myButton.heightAnchor.constraint(equalToConstant: 50)
        let buttonWidthConstraint = self.myButton.widthAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            buttonXCenter, buttonYCenter, buttonWidthConstraint ,buttonHeightConstraint
        ])
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
