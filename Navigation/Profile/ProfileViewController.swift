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
    
    private let photoProfile = ["1", "2", "3", "4"]
    
    var postNews = postProfile
    
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
        else {return self.postNews.count}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
                  if let cell1 = tableView.dequeueReusableCell(withIdentifier: "Photos", for: indexPath) as? PhotosTableViewCell {
                      cell1.cellConfigure(with: photoProfile)
                cell = cell1
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostProfile", for: indexPath) as! PostTableViewCell
            
            let post = postNews[indexPath.row]
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
        } else if indexPath.section == 1 {
            let postDetail = DetailViewController()
            navigationController?.present(postDetail, animated: true, completion: nil)
            let post = postNews[indexPath.row]
            let newsModel = DetailViewController.ModelPostNews(author: post.author, image: post.image, text: post.description)
            
            postDetail.setup(newsModel)
            
        }
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            postNews.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .right)
        }
    }
}


