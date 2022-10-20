//
//  PostViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 08.10.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(click))
        
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc func click() {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
