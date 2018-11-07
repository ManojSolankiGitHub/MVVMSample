//
//  LoginUser.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 07/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import Foundation

class User {
    
    let strEmail : String!
    let strPassword : String!
    var strToken : String?
    
    init(strEmail:String, strPassword:String,strToken:String?) {
        self.strEmail = strEmail
        self.strPassword = strPassword
        self.strToken = strToken
    }
}
