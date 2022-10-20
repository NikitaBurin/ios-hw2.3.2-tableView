//
//  LogInViewController.swift
//  Navigation
//
//  Created by Никита Бурин on 14.10.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    let logoVk = UIImageView()
    let stackForLoginPassword = UIStackView()
    let loginField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton()
    let scrollView = UIScrollView()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = "LogIn"
        tabBarItem = UITabBarItem(title: "LogIn", image: UIImage(systemName: "square.and.arrow.up"), tag: 2)
        navigationController?.navigationBar.isHidden = true
        scroll()
        setupLogoVK()
        setupLoginPasswordViews()
        setupLoginButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        subscribeKeyboardEvents()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    func scroll(){
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.frame.size.width, height: 1000)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(logoVk)
        scrollView.addSubview(loginButton)
        scrollView.addSubview(loginField)
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.size.height),
            scrollView.widthAnchor.constraint(equalToConstant: 1000)
        ])
    }

    func setupLogoVK(){
    
        scrollView.addSubview(logoVk)
        
        logoVk.image = UIImage(named: "logo")
        logoVk.translatesAutoresizingMaskIntoConstraints = false
        logoVk.contentMode = .scaleToFill
        
        NSLayoutConstraint.activate([
            logoVk.heightAnchor.constraint(equalToConstant: 100),
            logoVk.widthAnchor.constraint(equalToConstant: 100),
            logoVk.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoVk.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120)
        ])
    }
    
    func setupLoginPasswordViews(){
        
        scrollView.addSubview(stackForLoginPassword)
        
        stackForLoginPassword.addArrangedSubview(loginField)
        stackForLoginPassword.addArrangedSubview(passwordField)
        
        stackForLoginPassword.translatesAutoresizingMaskIntoConstraints = false
        stackForLoginPassword.axis = .vertical
        stackForLoginPassword.distribution = .fillEqually
        stackForLoginPassword.alignment = .fill
        stackForLoginPassword.spacing = 0
        stackForLoginPassword.layer.borderWidth = 0.5
        stackForLoginPassword.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        stackForLoginPassword.layer.cornerRadius = 10
        stackForLoginPassword.clipsToBounds = true
        
        loginField.backgroundColor = .systemGray6
        loginField.layer.borderWidth = 0.5
        loginField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        loginField.placeholder = "Login"
        loginField.autocapitalizationType = .none
        loginField.textColor = .black
        loginField.leftViewMode = UITextField.ViewMode.always
        loginField.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        
               
        passwordField.backgroundColor = .systemGray6
        passwordField.layer.borderWidth = 0.5
        passwordField.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        passwordField.placeholder = "Password"
        passwordField.autocapitalizationType = .none
        passwordField.textColor = .black
        passwordField.isSecureTextEntry = true
        passwordField.leftViewMode = UITextField.ViewMode.always
        passwordField.leftView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        
        NSLayoutConstraint.activate([
            stackForLoginPassword.heightAnchor.constraint(equalToConstant: 100),
            stackForLoginPassword.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            stackForLoginPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackForLoginPassword.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackForLoginPassword.topAnchor.constraint(equalTo: logoVk.bottomAnchor, constant: 120),
        ])
    }
    
    func setupLoginButton(){
       
        scrollView.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitle("Log in", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.addTarget(self, action: #selector(buttonState), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            loginButton.topAnchor.constraint(equalTo: stackForLoginPassword.bottomAnchor, constant: 16)
        ])
    }
    
    @objc func buttonState(){
        if loginButton.isSelected {
            loginButton.alpha = 0.8 }
        else if loginButton.isHighlighted {
            loginButton.alpha = 0.8 }
        else if loginButton.isEnabled == false {
            loginButton.alpha = 0.8 }
        else {
            loginButton.alpha = 1
            }
        let profileVC = ProfileViewController()
        self.navigationController?.pushViewController(profileVC, animated: true)
        }
    
    func subscribeKeyboardEvents(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:
            UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification){
        guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {return}
        self.scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height + 60, right: 0)
    }
}
