//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Никита Бурин on 18.10.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var author = UILabel()
    var picture = UIImageView()
    var discript = UITextView()
    var likes = UILabel()
    var views = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        settingPost()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func settingPost(){
        addSubview(author)
        addSubview(picture)
        addSubview(discript)
        addSubview(likes)
        addSubview(views)
        
        author.translatesAutoresizingMaskIntoConstraints = false
        author.font = UIFont.boldSystemFont(ofSize: 20)
        author.numberOfLines = 2
        
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.backgroundColor = .black
        picture.contentMode = .scaleAspectFit
        
        discript.translatesAutoresizingMaskIntoConstraints = false
        discript.font = UIFont.systemFont(ofSize: 14)
        discript.textColor = .lightGray
        
        likes.translatesAutoresizingMaskIntoConstraints = false
        likes.font = UIFont.systemFont(ofSize: 16)
        likes.textColor = .black
        
        views.translatesAutoresizingMaskIntoConstraints = false
        views.font = UIFont.systemFont(ofSize: 16)
        views.textColor = .black
        
        NSLayoutConstraint.activate([
            author.topAnchor.constraint(equalTo: topAnchor),
            author.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            author.rightAnchor.constraint(equalTo: rightAnchor),
            author.heightAnchor.constraint(equalToConstant: 50),
            
            picture.topAnchor.constraint(equalTo: author.bottomAnchor),
            picture.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            picture.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            picture.heightAnchor.constraint(equalToConstant: 200),
            
            discript.topAnchor.constraint(equalTo: picture.bottomAnchor),
            discript.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            discript.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
            discript.heightAnchor.constraint(equalToConstant: 50),
            
            likes.topAnchor.constraint(equalTo: discript.bottomAnchor),
            likes.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            likes.rightAnchor.constraint(equalTo: leftAnchor, constant: 100),
            likes.heightAnchor.constraint(equalToConstant: 20),
            
            views.topAnchor.constraint(equalTo: discript.bottomAnchor),
            views.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            views.leftAnchor.constraint(equalTo: rightAnchor, constant: -100),
            views.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func settingDataSource(massiv: Post){
        author.text = massiv.author
        picture.image = UIImage(named: massiv.image)
        discript.text = massiv.discription
        likes.text = "likes: \(String(massiv.likes))"
        views.text = "views: \(String(massiv.views))"
    }
}
