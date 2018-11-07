//
//  ServiceManager.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 07/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import Foundation

class ServiceManager {
    private static var sharedServiceManager : ServiceManager = {
        return ServiceManager()
    }()
    private init(){}
    
    class func defaultManager() -> ServiceManager{
        return sharedServiceManager //private static property
    }
    
    
    func login(userForLogin: User, completion: @escaping (String?, Error?) -> ()) {
        
        let urlString = baseUrl+loginMethod
        
        let parameters = ["email" : "peter@klaven", "password" : "cityslicka"]
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let err = err {
                completion("Failed to login" , err)
                return
            }
            
           guard let data = data else {return}
           
            do {
                let loginResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any]
                DispatchQueue.main.async {
                    completion(loginResponse!["token"] as? String , nil)
                }
            }catch {
                DispatchQueue.main.async {
                    completion(nil, nil)
                }
            }
        }
        task.resume()
    }
}
