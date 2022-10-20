//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 11.10.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var tableView = UITableView()
    var dataArray: [Post] = []
    let header = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.circle"), tag: 1)
        
        dataArray = postArray()

        view.addSubview(tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 325
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell") as! PostTableViewCell
        let x = dataArray[indexPath.row]
        cell.settingDataSource(massiv: x)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var header = UIView()
        if section == 0 {
            header = ProfileHeaderView()
            header.backgroundColor = .white
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 220
    }
}

extension ProfileViewController {
    
    func postArray() -> [Post]{
        let firstPlace = Post(author: "France football Ballon d'Or",
                              discription: "1st place - Karim Benzema",
                              image: "benzema",
                              likes: 1,
                              views: 1)
        let secondPlace = Post(author: "France football Ballon d'Or",
                               discription: "2nd place - Sadio Mane",
                               image: "mane",
                               likes: 2,
                               views: 2)
        let thirdPlace = Post(author: "France football Ballon d'Or",
                              discription: "3rd place - Kevin de Bruyne",
                              image: "kevin", likes: 3, views: 3)
        let fourthPlace = Post(author: "France football Ballon d'Or",
                               discription: "4th place - Robert Lewandowski",
                               image: "lewa",
                               likes: 4,
                               views: 4)
        let fifthPlace = Post(author: "France football Ballon d'Or",
                              discription: "5th place - Mohamed Salah",
                              image: "salah",
                              likes: 5,
                              views: 5)
 
    return [fifthPlace, fourthPlace, thirdPlace, secondPlace, firstPlace]
    }
}


