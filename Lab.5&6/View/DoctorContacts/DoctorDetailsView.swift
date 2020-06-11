//
//  DoctorDetailsView.swift
//  Lab.5&6
//
//  Created by vladikkk on 10/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI
import CoreLocation

struct DoctorDetailsView: View {
    
    @State var fullName: String
    @State var speciality: String
    @State var rating: Double
    @State var description: String
    @State var address: String
    var location: CLLocationCoordinate2D
        
    var Photo: Image
    
    var body: some View {
        NavigationView {
            ScrollView {
                DoctorView(fullName: self.fullName, speciality: self.speciality, rating: self.rating, address: self.address, Photo: self.Photo)
                
                DescriptionView(description: self.description, address: address)
                
                MapView(coordinate: location)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300)
                
                Spacer()
                    .frame(height: 50)
                
                Button(action: {
                    print("REQUEST")
                }) {
                    Text("Request")
                        .frame(width: 355, height: 50, alignment: .center)
                        .font(.custom("Avenir", size: 20))
                        .background(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                        .foregroundColor(.white)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white, lineWidth: 2)
                    )
                }
                
                BottomNavigationView()
            }
        }
        .navigationBarTitle("Doctor Details")
        .navigationBarHidden(true)
    }
}

struct DoctorDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorDetailsView(fullName: "Dudung Sokmati", speciality: "Eye Specialist", rating: 4.9,description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", address: "Doc", location: CLLocationCoordinate2D(), Photo: Image(systemName: "person"))
    }
}
