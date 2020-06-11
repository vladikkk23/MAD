//
//  UserData.swift
//  Lab.5&6
//
//  Created by vladikkk on 21/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import Foundation

struct UserData: Codable {
    var FullName: String
    var Birthday: String
    var Email: String
    var Phone: String
    var Address: String
    var Username: String
    var Base64Photo: Data
    var Status: String?
}
