//
//  ApprovedRequestView.swift
//  Lab.5&6
//
//  Created by vladikkk on 30/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct ApprovedRequestView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 30) {
                    Image(systemName: "checkmark.circle")
                        .resizable()
                        .clipped()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                        .background(Color.clear)
                        .cornerRadius(100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 1)
                                .stroke(Color.init(red: 8/255, green: 217/255, blue: 94/255), lineWidth: 0)
                    )
                    
                    VStack(alignment: .center, spacing: 10) {
                        Text("Your Request Has Been Approved")
                            .font(.custom("Avenir", size: 18))
                            .fontWeight(.medium)
                            .frame(width: 200, height: 50)
                            .clipped()
                            .lineLimit(2)
                            .multilineTextAlignment(.center)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                            .font(.custom("Avenir", size: 14))
                            .frame(width: 320, height: 70)
                            .clipped()
                            .lineLimit(3)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Request Details")
                            .padding(.leading, -183)
                            .foregroundColor(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                            .font(.custom("Avenir Next", size: 16))
                        
                    }
                    .padding(.top, 30)
                    .frame(width: 400)
                    
                    RequestDetailsView(name: "name", desease: "desease", location: "location", description: "description")
                        .padding(.leading)
                    
                    
                    
                    VStack(alignment: .leading) {
                        Text("Doctor")
                            .foregroundColor(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                            .font(.custom("Avenir Next", size: 16))
                        
                        DoctorView(fullName: "Dudung Sokmati", speciality: "Eye Specialist", rating: 4.9, address: "Doc", Photo: Image(systemName: "person"))
                    }
                    .padding()
                    
                    NavigationLink(destination: DoctorListView()) {
                        Text("Confirm")
                            .frame(width: 355, height: 60, alignment: .center)
                            .font(.custom("Avenir", size: 20))
                            .background(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                            .foregroundColor(.white)
                            .cornerRadius(30)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                            .padding(.top, 20)
                    }
                    
                    Button(action: {
                        print("Cancel Request")
                    }) {
                        Text("Cancel Request")
                            .frame(width: 355, height: 60, alignment: .center)
                            .font(.custom("Avenir", size: 20))
                            .background(Color.clear)
                            .foregroundColor(.secondary)
                            .cornerRadius(30)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.secondary, lineWidth: 2)
                        )
                            .padding(.top, 20)
                    }
                    
                    BottomNavigationView()
                }
            }
            .frame(width: 450, alignment: .center)
        }
        .navigationBarTitle("Notofication")
        .navigationBarHidden(true)
    }
}
struct ApprovedRequestView_Previews: PreviewProvider {
    static var previews: some View {
        ApprovedRequestView()
    }
}
