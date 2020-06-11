//
//  DoctorListElement.swift
//  Lab.5&6
//
//  Created by vladikkk on 10/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct DoctorListElement: View {
    
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
            
            VStack(spacing: 0) {
                HStack(alignment: .firstTextBaseline, spacing: 20) {
                    Text(fullName)
                        .font(.custom("Avenir", size: 21))
                        .fontWeight(.medium)
                    
                    HStack(spacing: 10) {
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        
                        Text(String(rating))
                            .frame(width: 30)
                            .font(.custom("Avenir", size: 18))
                            .foregroundColor(.gray)
                        
                    }
                }
                .frame(minWidth: 200)
                .padding()
                
                Text(speciality)
                    .font(.custom("Avenir", size: 18))
                    .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.gray)
                    
                    Text(address)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
}

struct DoctorListElement_Previews: PreviewProvider {
    static var previews: some View {
        DoctorListElement(fullName: "Doc", speciality: "Doc",rating: 4.9,  address: "Doc", Photo: Image(systemName: "person"))
    }
}
