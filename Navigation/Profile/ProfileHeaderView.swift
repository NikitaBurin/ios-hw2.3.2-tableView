//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Никита Бурин on 11.10.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var profileName: UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What The Duck"
        label.textColor = .black
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        return label
    }
    
    var profilePhoto: UIImageView{
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.bounds = CGRect(x: 0, y: 0, width: 140, height: 140)
        imageView.layer.cornerRadius = imageView.bounds.size.width/2
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0.6)
        imageView.image = UIImage(named: "duck")
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }
    
    var statusLabel: UILabel{
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.font = UIFont(name:"HelveticaNeue-Regular", size: 14)
        label.textColor = .darkGray
        return label
    }
    
    var statusButton: UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue
        button.setTitle("Add status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }
    
    var statusTextField: UITextField{
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .white
        field.layer.borderWidth = 1
        field.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        field.font = UIFont(name:"HelveticaNeue-Regular", size: 15)
        field.layer.cornerRadius = 12
        field.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return field
    }
    
    private var statusText: String = ""
    
    func setupLayout(){
        let profileName = self.profileName
        let profilePhoto = self.profilePhoto
        let statusLabel = self.statusLabel
        let statusButton = self.statusButton
        let statusTextField = self.statusTextField
        
        addSubview(profileName)
        addSubview(profilePhoto)
        addSubview(statusLabel)
        addSubview(statusButton)
        addSubview(statusTextField)
        
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            profileName.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 20),

            profilePhoto.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profilePhoto.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            profilePhoto.heightAnchor.constraint(equalToConstant: profilePhoto.bounds.size.height),
            profilePhoto.widthAnchor.constraint(equalToConstant: profilePhoto.bounds.size.width),

            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 10),
            statusLabel.leftAnchor.constraint(equalTo: profileName.leftAnchor),

            statusButton.topAnchor.constraint(equalTo: profilePhoto.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),

            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            statusTextField.leftAnchor.constraint(equalTo: profileName.leftAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    @objc func buttonPressed(){
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text!
    }
}


