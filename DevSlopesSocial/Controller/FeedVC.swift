//
//  FeedVCViewController.swift
//  DevSlopesSocial
//
//  Created by Stevan Medic on 6/13/18.
//  Copyright © 2018 Stevan Medic. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func signOutClicked(_ sender: Any) {
        
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! Auth.auth().signOut()
        performSegue(withIdentifier: "goToSignInScreen", sender: nil)
    }
}
