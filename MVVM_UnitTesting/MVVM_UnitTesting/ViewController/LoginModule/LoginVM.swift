//
//  LoginVM.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 07/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import Foundation

protocol LoginProtocol {
    func success(loggedInUser: User)
}

class LoginVM {
    
    var loggedInUser : User?
    
    var delegate: LoginProtocol?
    
    // Dependency Injection (DI)
    init(loggedInUser:User? = nil) {
        self.loggedInUser = loggedInUser
    }
    
    func goLoginUser(userForLogin:User)  {
        self.loggedInUser = userForLogin
        
        ServiceManager.defaultManager().login(userForLogin: self.loggedInUser!) { (token, error) in
            userForLogin.strToken = token
            self.delegate?.success(loggedInUser: self.loggedInUser!)
        }
        
    }
}
