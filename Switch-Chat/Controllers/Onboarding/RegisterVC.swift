//
//  RegisterVC.swift
//  Switch-Chat
//
//  Created by Omar Leal on 10/28/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    
    private let loginImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "setPhoto")
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
    
    
    private let firstNameField: UITextField = {
       let userEmail = UITextField()
        userEmail.translatesAutoresizingMaskIntoConstraints = false
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

        userEmail.attributedPlaceholder = NSAttributedString(
            string: "First Name",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)]
        )
        return userEmail
    }()
    
    private let lastNameField: UITextField = {
       let userEmail = UITextField()
        userEmail.translatesAutoresizingMaskIntoConstraints = false
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
        userEmail.attributedPlaceholder = NSAttributedString(
            string: "Last Name",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00)]
        )
        return userEmail
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
       password.isSecureTextEntry = true
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [ NSAttributedString.Key.foregroundColor: UIColor(red: 0.68, green: 0.71, blue: 0.74, alpha: 1.00) ]
        )
        return password
    }()
    
    private let saveButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor(red: 0.95, green: 0.95, blue: 0.99, alpha: 1.00), for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = UIFont(name: "Mulish-Bold", size: 18)
        button.layer.backgroundColor = UIColor(red: 0.00, green: 0.18, blue: 0.89, alpha: 1.00).cgColor
        return button
    }()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        // Adding child views
        [ loginImage,
          firstNameField,
          lastNameField,
          emailField,
          passwordField,
          saveButton
        ].forEach(scrollView.addSubview)
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        saveButton.addTarget(self, action: #selector(didTapSave), for: .touchUpInside)
        configuredConstraints() // autolayout rules
        
        
        // changing profile photo with gestures
        loginImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapChangeProfilePhoto))
        gesture.numberOfTouchesRequired = 1
        gesture.numberOfTapsRequired = 1
        loginImage.addGestureRecognizer(gesture)
    }
    
   
    @objc private func didTapChangeProfilePhoto() {
        print("gesture on profile ")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.frame
    }
    
    
    private func alertError() {
        let alertPop = UIAlertController(title: "Woop", message: "Please enter all the information in order to create your account", preferredStyle: .alert)
        alertPop.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alertPop, animated: true)
    }
    
    
   
    @objc private func didTapSave() {
        firstNameField.resignFirstResponder()
        lastNameField.resignFirstResponder()
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        
        guard let email = emailField.text, let pass = passwordField.text, let name = firstNameField.text, let surname = lastNameField.text,
            name.isEmpty , surname.isEmpty ,email.isEmpty, !pass.isEmpty, pass.count > 6 else {
            alertError()
            return
        }
        
        
    }
    

    private func configuredConstraints() {
        let imageLogo = [
            loginImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            loginImage.widthAnchor.constraint(equalToConstant: 100),
            loginImage.heightAnchor.constraint(equalToConstant: 101)
        ]
        
        let firstNameConstraints = [
            firstNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            firstNameField.topAnchor.constraint(equalTo: loginImage.bottomAnchor, constant: 32),
            firstNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            firstNameField.heightAnchor.constraint(equalToConstant: 46),
            //firstNameField.widthAnchor.constraint(equalToConstant: 327)
        ]
        
        let lastNameConstraints = [
            lastNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 32),
            lastNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            lastNameField.heightAnchor.constraint(equalToConstant: 46),
            //lastNameField.widthAnchor.constraint(equalToConstant: 327)
        ]
        
        let email =  [
            emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 32),
            emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailField.heightAnchor.constraint(equalToConstant: 46),
           // emailField.widthAnchor.constraint(equalToConstant: 327)
        ]
        
        let passwordInput = [
            passwordField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 32),
            passwordField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            passwordField.heightAnchor.constraint(equalToConstant: 46),
            //passwordField.widthAnchor.constraint(equalToConstant:  scrollView.frame.width)
        ]
        
        let saveButtonConstraints = [
           saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            saveButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 68),
           saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            saveButton.heightAnchor.constraint(equalToConstant: 52),
           // saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
        ]
     
        
        
        NSLayoutConstraint.activate(imageLogo)
        NSLayoutConstraint.activate(firstNameConstraints)
        NSLayoutConstraint.activate(lastNameConstraints)
        NSLayoutConstraint.activate(email)
        NSLayoutConstraint.activate(passwordInput)
        NSLayoutConstraint.activate(saveButtonConstraints)
  
    }
  

}


extension RegisterVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameField {
            lastNameField.becomeFirstResponder()
        } else if textField == lastNameField {
            emailField.becomeFirstResponder()
        } else if textField == emailField {
            passwordField.becomeFirstResponder()
        } else if textField == passwordField {
            didTapSave()
        }
        
        return true
    }
}
