//
//  ViewController.swift
//  Switch-Chat
//
//  Created by Omar Leal on 10/28/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LOGIN"
        view.backgroundColor = .lightGray

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapRegister))
    }
    

    @objc private func didTapRegister() {
        let registerVC = RegisterVC()
        registerVC.title = "Create an Account"
        navigationController?.pushViewController(registerVC, animated: true)
        
        
    }

}
