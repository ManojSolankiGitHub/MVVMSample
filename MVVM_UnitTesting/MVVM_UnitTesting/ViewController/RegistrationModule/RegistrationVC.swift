//
//  RegistrationVC.swift
//  MVVM_UnitTesting
//
//  Created by Manoj Solanki on 08/11/18.
//  Copyright © 2018 ManojSolanki. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController,RegistrationProtocol {

    var registrationVM = RegistrationVM()
    
    @IBOutlet var txtEmailId: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registrationVM.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: LoginVM delegate methods
    func success(registeredUser: User) {
        print(registeredUser.strToken ?? "")
    }
    func failure(error: Error) {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
