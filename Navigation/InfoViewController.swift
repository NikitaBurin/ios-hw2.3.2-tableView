//
//  InfoViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 08.10.2022.
//

import UIKit

class InfoViewController: UIViewController {

    let butt = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        view.addSubview(butt)
        
        butt.frame.size.width = 180
        butt.frame.size.height = 30
        butt.layer.cornerRadius = 15
        butt.center = view.center
        butt.setTitleColor(.black, for: .normal)
        butt.backgroundColor = .white
        butt.setTitle("Alert", for: .normal)
        butt.addTarget(self, action: #selector(buttAction), for: .touchUpInside)
    }
    
    @objc func buttAction(){
        let alertController = UIAlertController(title: "Внимание", message: "Все сломалось", preferredStyle: .alert)
        let actionOne = UIAlertAction(title: "Чинить", style: .default) { UIAlertAction in
            print("Чиним")
        }
        let actionTwo = UIAlertAction(title: "Паниковать", style: .default) { UIAlertAction in
            print("Паникуем")
        }

        alertController.addAction(actionOne)
        alertController.addAction(actionTwo)
        present(alertController, animated: true)
    }
    
}
