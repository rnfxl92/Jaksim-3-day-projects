//
//  FBUser.swift
//  project03-FacebookMe
//
//  Created by 박성민 on 2021/04/06.
//

import Foundation

class FBUser {
    var name: String
    var avatarName: String
    var education: String
    
    init(name: String, avatarName: String = "bayMax", education: String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
