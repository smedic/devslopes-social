//
//  PostCell.swift
//  DevSlopesSocial
//
//  Created by Stevan Medic on 6/14/18.
//  Copyright © 2018 Stevan Medic. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImage : UIImageView!
    @IBOutlet weak var usernameLabel : UILabel!
    @IBOutlet weak var postImage : UIImageView!
    @IBOutlet weak var caption : UILabel!
    @IBOutlet weak var likesLable : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
