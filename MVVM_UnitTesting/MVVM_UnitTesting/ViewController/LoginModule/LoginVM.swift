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
    func failure(error: Error)
}

class LoginVM {
    
    var loggedInUser : User?
    var delegate: LoginProtocol?
    
    // 1. Dependency Injection (DI); 2.Following snippets give you two constructers one with User object and on without User object
    init(loggedInUser:User? = nil) {
        self.loggedInUser = loggedInUser
    }
    
    func goLoginUser()  {
        
        ServiceManager.defaultManager().login(userForLogin: self.loggedInUser!) { (token, error) in
            if error != nil{
                self.loggedInUser?.strToken = token
                self.delegate?.success(loggedInUser: self.loggedInUser!)
            }else{
                self.delegate?.failure(error: error!)
            }
        }
    }
}
