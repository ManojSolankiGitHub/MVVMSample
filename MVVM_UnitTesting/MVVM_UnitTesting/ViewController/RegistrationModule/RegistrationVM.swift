//
//  RegistrationVM.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 08/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import Foundation

protocol RegistrationProtocol {
    func success(registeredUser: User)
    func failure(error: Error)
}

class RegistrationVM {
    
    var toBeRegisterUser : User?
    var delegate: RegistrationProtocol?
    
    // 1. Dependency Injection (DI); 2.Following snippets give you two constructers one with User object and on without User object
    init(toBeRegisterUser:User? = nil) {
        self.toBeRegisterUser = toBeRegisterUser
    }
    
    func goRegisterUser()  {
        
        ServiceManager.defaultManager().registration(userForRegistration: self.toBeRegisterUser!) { (token, error) in
            if error != nil{
                self.toBeRegisterUser?.strToken = token
                self.delegate?.success(registeredUser: self.toBeRegisterUser!)
            }else{
                self.delegate?.failure(error: error!)
            }
        }
    }
}
