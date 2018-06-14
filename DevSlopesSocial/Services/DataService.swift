//
//  DataService.swift
//  DevSlopesSocial
//
//  Created by Stevan Medic on 6/15/18.
//  Copyright © 2018 Stevan Medic. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    private var _REF_DB_BASE = DB_BASE
    private var _REF_POSTS = DB_BASE.child("posts")
    private var _REF_USERS = DB_BASE.child("users")
    
    static let instance = DataService()
    
    var REF_DB_BASE : DatabaseReference {
        return _REF_DB_BASE
    }
    
    var REF_POSTS : DatabaseReference {
        return _REF_POSTS
    }
    
    var REF_USERS : DatabaseReference {
        return _REF_USERS
    }
    
    func createFirDbUser(uid: String, userData: Dictionary<String, String>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
}
