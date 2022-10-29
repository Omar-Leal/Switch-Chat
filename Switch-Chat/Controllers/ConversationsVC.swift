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
        view.backgroundColor = .blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*  With userDefautl we check if the user is logged in or is not  */
        let userIsLogged = UserDefaults.standard.bool(forKey: "userIsLogged")
        
        
        /*  Checking if the user is logged inf  */
        if !userIsLogged {
            /* if it's not logged  so we bring the Login ScreenController */
            
            let loginVC = LoginViewController()
            let navigation = UINavigationController(rootViewController: loginVC)
            navigation.modalPresentationStyle = .fullScreen
            present(navigation, animated: true)
        }
    }

   
}



