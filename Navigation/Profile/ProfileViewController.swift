//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Кирилл Демьянцев on 17.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var tableView: UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.rowHeight = UITableView.automaticDimension
        table.backgroundColor = .systemGray4
        table.estimatedRowHeight = 44
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        table.register(PostTableViewCell.self, forCellReuseIdentifier: "PostProfile")
        table.register(PhotosTableViewCell.self, forCellReuseIdentifier: "Photos")
        return table
    }()
    
    var photoProfile: [String] = ["1", "2", "3", "4"]
    
    private var postProfile: [PostProfile] = [
        .init(author: "No name", description: "Вконтакте представила функцию по переносу фото и видео из Instagram. С сегодняшнего дня Instagram в России недоступен. О блокировке Роскомнадзор предупредил за два дня и дал время на загрузку всех фото, видео и данных.", image: "vkNews", likes: 500, views: 1500),
        .init(author: "Костя Баранов", description: "Apple выпустила iOS 15.4 с новыми эмодзи и разблокировкой айфона в маске.", image: "ios", likes: 208, views: 500),
        .init(author: "Wylsacom", description: "Как просто покупать приложения и оплачивать подписки в App Store и Google Play в России. В App Store больше нельзя воспользоваться российскими картами. Связано это с тем, что Visa и Mastercard ушли из РФ, а перед этим отключили SWIFT. Оплата просто не будет проходить.", image: "appStor", likes: 407, views: 1200),
        .init(author: "apple.news", description: "Базовый Mac Studio с Apple M1 Max стоит $1999, а если покупать с M1 Ultra, то придётся удвоить бюджет.", image: "macStudio", likes: 1230, views: 1500)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.view.addSubview(tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.hidesBarsOnSwipe = true
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {return 1}
        else {return self.postProfile.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
          if let cell1 = tableView.dequeueReusableCell(withIdentifier: "Photos", for: indexPath) as? PhotosTableViewCell {
              cell1.cellConfigure(with: photoProfile[indexPath.row])
                cell = cell1
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostProfile", for: indexPath) as! PostTableViewCell
            
            let post = postProfile[indexPath.row]
            let viewModel2 = PostTableViewCell.ModelPost(author: post.author, image: post.image, text: post.description, likes: post.likes, views: post.views)
            
            cell.setup(with: viewModel2)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileTableHeaderView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {return 265}
        return 0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let gallery = PhotosViewController()
            navigationController?.pushViewController(gallery, animated: true)
        }
    }
}


