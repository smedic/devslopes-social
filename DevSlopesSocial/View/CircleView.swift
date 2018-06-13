//
//  CircleView.swift
//  DevSlopesSocial
//
//  Created by Stevan Medic on 6/14/18.
//  Copyright © 2018 Stevan Medic. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
}
