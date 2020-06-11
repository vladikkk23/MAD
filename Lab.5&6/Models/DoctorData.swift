//
//  DoctorData.swift
//  Lab.5&6
//
//  Created by vladikkk on 10/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import UIKit
import MapKit

struct DoctorData: Identifiable {
    var id : Int
    var fullname = ""
    var rank = 0.0
    var speciality = ""
    var description = ""
    var address = ""
    var coordinates = CLLocationCoordinate2D()
    var image: UIImage
}
