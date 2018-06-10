//
//  ViewController.swift
//  DevSlopesSocial
//
//  Created by Stevan Medic on 6/7/18.
//  Copyright © 2018 Stevan Medic. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import FBSDKLoginKit

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func fbButtonClicked(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager();
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("SMEDIC unable to auth with facebook")
            }
            
            if result?.isCancelled == true {
                print("SMEDIC user canceled auth")
            } else {
                print("SMEDIC Success")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuthenticate(credential)
            }
        }
    }
    
    func firebaseAuthenticate(_ credential : AuthCredential) {
        Auth.auth().signInAndRetrieveData(with: credential, completion: { (result, error) in
            if error != nil {
                print("SMEDIC unable to auth with firebase: \(error)")
            } else {
                print("SMEDIC success authenticatin with firebase")
            }
        })
    }
    
}

