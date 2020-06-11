//
//  ConsultationResponse.swift
//  Lab.5&6
//
//  Created by vladikkk on 21/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import Foundation

struct ConsultationResponse: Codable {
    var ConsId: Int
    var Name: String
    var Disease: String
    var Address: String
    var Description: String?
    var DocId: Int
    var IsConfirmed: Bool
}
