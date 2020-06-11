//
//  DoctorData.swift
//  Lab.5&6
//
//  Created by vladikkk on 21/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import Foundation

struct DoctorWebData: Codable {
    var DocId: Int
    var FullName: String
    var Specs: String
    var Address: String
    var About: String
    var Stars: Double
    var Photo: Data
}
