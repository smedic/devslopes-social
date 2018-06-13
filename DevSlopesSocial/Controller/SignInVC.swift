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
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    @IBOutlet weak var passwordField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let key = KeychainWrapper.standard.string(forKey: KEY_UID) {
            print("SMEDIC KeychainWrapper user id: \(key)")
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
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
                print("SMEDIC unable to auth with firebase: \(error?.localizedDescription)")
            } else {
                print("SMEDIC success authenticatin with firebase")
                if let user = result?.user {
                    self.completeSignIn(id: user.uid)
                }
            }
        })
    }
    
    func completeSignIn(id: String) {
        KeychainWrapper.standard.set(id, forKey: KEY_UID)
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
    
    @IBAction func signInClicked(_ sender: Any) {
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if error == nil {
                    print("SMEDIC logged in successfully")
                    if let user = result?.user {
                        self.completeSignIn(id: user.uid)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                        if error != nil {
                            print("SMEDIC user not created")
                        } else {
                            print("SMEDIC user created!")
                            if let user = result?.user {
                                self.completeSignIn(id: user.uid)
                            }
                        }
                    }
                }
            }
        }
    }
    
}

