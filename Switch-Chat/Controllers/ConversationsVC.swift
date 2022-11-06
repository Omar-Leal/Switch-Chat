//
//  ViewController.swift
//  Switch-Chat
//
//  Created by Omar Leal on 10/28/22.
//

import UIKit

class ConversationsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*  With userDefautl we check if the user is logged in or is not  */
        let userAlreadyLogged = UserDefaults.standard.bool(forKey: "user_Already_Logged")
        
        
        /*  Checking if the user is logged inf  */
        if !userAlreadyLogged {
            /* if it's not logged  so we bring the Login ScreenController */
            
            let loginVC = LoginVC()
            let navigation = UINavigationController(rootViewController: loginVC)
            navigation.modalPresentationStyle = .popover
            present(navigation, animated: true)
        }
    }

   
}



