//
//  ServiceManager.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 07/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import Foundation

class ServiceManager {
    
    //Thread safety
    private static var sharedServiceManager : ServiceManager = {
        return ServiceManager()
    }()
    //Restricting to create another instance of Service manager
    private init(){}
    
    class func defaultManager() -> ServiceManager{
        return sharedServiceManager
    }
    
    //Instance Variables
    private let BASEURL = "https://reqres.in/api/"
    
    func login(userForLogin: User, completion: @escaping (String?, Error?) -> ()) {
        
        let urlString = BASEURL+LOGINMETHOD
        //Existing Username: peter@klaven , Password: cityslicka
        
        let parameters = [EMAIL : userForLogin.strEmail, PASSWORD : userForLogin.strPassword]
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = POST
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let loginResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    throw JSONError.ConversionFailed
                }
                DispatchQueue.main.async {
                    completion(loginResponse["token"] as? String , nil)
                }
            } catch let error as JSONError {
                completion("Failed to login: \(error.rawValue)" , error)
                print(error.rawValue)
            } catch let error as NSError {
                completion("Failed to login: \(error.debugDescription)" , error)
                print(error.debugDescription)
            }
        }
        task.resume()
    }
    
    func registration(userForRegistration: User, completion: @escaping (String?, Error?) -> ()) {
        
        let urlString = BASEURL+REGISTRATIONMETHOD
        
        let parameters = [EMAIL : userForRegistration.strEmail, PASSWORD : userForRegistration.strPassword]
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = POST
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            do {
                guard let data = data else {
                    throw JSONError.NoData
                }
                guard let loginResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] else {
                    throw JSONError.ConversionFailed
                }
                DispatchQueue.main.async {
                    completion(loginResponse["token"] as? String , nil)
                }
            } catch let error as JSONError {
                completion("Failed to login: \(error.rawValue)" , error)
                print(error.rawValue)
            } catch let error as NSError {
                completion("Failed to login: \(error.debugDescription)" , error)
                print(error.debugDescription)
            }
        }
        task.resume()
    }
}
