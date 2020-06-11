//
//  DoctorView.swift
//  Lab.5&6
//
//  Created by vladikkk on 30/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI
import MapKit

struct DoctorView: View {
    
    @State var fullName: String
    @State var speciality: String
    @State var rating: Double
    @State var address: String
    
    var Photo: Image
    
    var body: some View {
        HStack {
            Photo
                .resizable()
                .clipped()
                .frame(width: 75, height: 75)
                .cornerRadius(100)
                .overlay(
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.clear, lineWidth: 0)
                )
            
            VStack(alignment: .leading, spacing: 5) {
                Text(fullName)
                    .font(.custom("Avenir", size: 21))
                    .fontWeight(.medium)
                Text(speciality)
                    .font(.custom("Avenir", size: 18))
                    .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                
                RatingView(rating: 4.9)
            }
        }
        .frame(width: 320, height: 120, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 0)
                .stroke(Color.init(red: 243/255, green: 247/255, blue: 247/255), lineWidth: 2)
        )
    }
}

struct DoctorView_Previews: PreviewProvider {
    static var previews: some View {
        DoctorView(fullName: "Dudung Sokmati", speciality: "Eye Specialist", rating: 4.9, address: "CLLocationCoordinate2D", Photo: Image(systemName: "person"))
    }
}
