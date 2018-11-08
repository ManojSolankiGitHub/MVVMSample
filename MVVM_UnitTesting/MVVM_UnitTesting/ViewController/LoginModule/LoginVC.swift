//
//  ViewController.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 07/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,LoginProtocol {

    var loginVM = LoginVM()
    
    @IBOutlet var txtEmailId: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginVM.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let objUser = User(strEmail: txtEmailId.text!, strPassword: txtPassword.text!, strToken: nil)
        loginVM.loggedInUser = objUser
        loginVM.goLoginUser()
    }
    
    //MARK: LoginVM delegate methods
    func success(loggedInUser: User) {
        print(loggedInUser.strToken ?? "")
    }
    func failure(error: Error) {
        
    }
}

