//
//  ViewController.swift
//  Switch-Chat
//
//  Created by Omar Leal on 10/28/22.
//

import UIKit

class LoginVC: UIViewController {
    
    private let loginImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "loginImage")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private let scrollView: UIScrollView = {
       let scrollview = UIScrollView()
        scrollview.clipsToBounds = true
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    
    private let emailField: UITextField = {
       let userEmail = UITextField()
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        userEmail.keyboardType = .emailAddress
        userEmail.autocapitalizationType = .none
        userEmail.autocorrectionType = .no
        userEmail.returnKeyType = .continue
        userEmail.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
        userEmail.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.99, alpha: 1.00)
        userEmail.layer.cornerRadius = 8
        userEmail.font = UIFont.init(name: "Mulish-Medium", size: 15)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8, height: 2.0))
        userEmail.leftView = leftView
        userEmail.leftViewMode = .always
        userEmail.isSecureTextEntry = true
        userEmail.attributedPlaceholder = NSAttributedString(
            string: "Your email",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)]
        )
        return userEmail
    }()
    
    private let passwordField: UITextField = {
       let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocapitalizationType = .none
        password.autocorrectionType = .no
        password.returnKeyType = .done
        password.textColor = UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)
        password.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.99, alpha: 1.00)
        password.layer.cornerRadius = 8
        password.font = UIFont.init(name: "Mulish-Medium", size: 15)
        let leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8, height: 2.0))
        password.leftView = leftView
        password.leftViewMode = .always
       // password.isSecureTextEntry = true
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00) ]
        )
        return password
    }()
    
    private let loginButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor(red: 0.95, green: 0.95, blue: 0.99, alpha: 1.00), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont(name: "Mulish-Bold", size: 18)
        button.layer.backgroundColor = UIColor(red: 0.00, green: 0.18, blue: 0.89, alpha: 1.00).cgColor
        return button
    }()
    
    private let bellowText: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Terms & Privacy Policy"
       return text
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Mulish-SemiBold", size: 20)!]
        loginButton.addTarget(LoginVC.self, action: #selector(tapLoginButton), for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        
        view.addSubview(scrollView)
        // Adding child views
        [ loginImage,
          emailField,
          passwordField,
          loginButton
        ].forEach(scrollView.addSubview)
        configuredConstraints() // autolayouts rules
        
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
    }

    func alertUserLoginError() {
        let alert = UIAlertController(title: "Weak password", message: "Minimun of character it's 6", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
    }

    @objc private func tapLoginButton() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
         guard let email = emailField.text, let pass = passwordField.text,
               email.isEmpty, !pass.isEmpty, pass.count > 6 else {
         alertUserLoginError()
         return
        }
    // Login process here if the guard transfer the control
        
    }
    

    @objc private func didTapRegister() {
        let registerVC = RegisterVC()
        registerVC.title = "Create an Account"
        navigationController?.pushViewController(registerVC, animated: true)
        
        
    }
    
    
    private func configuredConstraints() {
        let imageLogo = [
            loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            loginImage.widthAnchor.constraint(equalToConstant: 212),
            loginImage.heightAnchor.constraint(equalToConstant: 221)
        ]
        
        let email =  [
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailField.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 32),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailField.heightAnchor.constraint(equalToConstant: 46),
           // emailField.widthAnchor.constraint(equalToConstant: 327)
        ]
        
        let passwordInput = [
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 12),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordField.heightAnchor.constraint(equalToConstant: 46),
            //passwordField.widthAnchor.constraint(equalToConstant:  scrollView.frame.width)
        ]
        
        let logInButton = [
           loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            loginButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 68),
           loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
           // loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ]
     
        
        
        NSLayoutConstraint.activate(imageLogo)
        NSLayoutConstraint.activate(email)
        NSLayoutConstraint.activate(passwordInput)
        NSLayoutConstraint.activate(logInButton)
  
    }
  
}

//
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            tapLoginButton()
        }
        
        return true
    }
}
