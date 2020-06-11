//
//  DoctorListView.swift
//  Lab.5&6
//
//  Created by vladikkk on 10/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct DoctorListView: View {
    
    var doctorData: [DoctorData] = WebService.shared.doctorsList
    var testData: [DoctorData] = [DoctorData(id: 1, image: UIImage(systemName: "person")!), DoctorData(id: 2,  image: UIImage(systemName: "person")!), DoctorData(id: 3,  image: UIImage(systemName: "person")!)]
    
    var body: some View {
        NavigationView {
            VStack {
                List(doctorData) { doctor in
                    NavigationLink(destination: DoctorDetailsView(fullName: doctor.fullname, speciality: doctor.speciality, rating: doctor.rank, description: doctor.description, address: doctor.address, location: doctor.coordinates, Photo: Image(uiImage: doctor.image))) {
                        DoctorListElement(fullName: doctor.fullname, speciality: doctor.speciality, rating: doctor.rank, address: doctor.address, Photo: Image(uiImage: doctor.image))
                    }
                }
                BottomNavigationView()
            }
        }
        .navigationBarTitle("Doctor List")
        .navigationBarHidden(true)
    }
}

struct DoctorListView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListView()
    }
}
