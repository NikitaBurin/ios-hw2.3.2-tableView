//
//  FeedViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 07.10.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let stack = UIStackView()
    let stackButtonFirst = UIButton()
    let stackButtonSecond = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        title = "Feed"
        tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "doc.richtext"), tag: 0)
        
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.spacing = 10
        stack.backgroundColor = .systemPurple
        
        stack.addArrangedSubview(stackButtonFirst)
        stack.addArrangedSubview(stackButtonSecond)
        
        stackButtonFirst.setTitle("First button", for: .normal)
        stackButtonFirst.setTitleColor(.black, for: .normal)
        stackButtonFirst.backgroundColor = .white
        stackButtonFirst.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        stackButtonSecond.setTitle("Second button", for: .normal)
        stackButtonSecond.setTitleColor(.black, for: .normal)
        stackButtonSecond.backgroundColor = .white
        stackButtonSecond.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 200),
            stack.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    @objc func buttonAction() {
            let profileVC = ProfileViewController()
            self.navigationController?.pushViewController(profileVC, animated: true)
       }
}
