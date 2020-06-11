//
//  HomeScreenView.swift
//  Lab.5&6
//
//  Created by vladikkk on 28/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var name = ""
    @State var disease = ""
    @State var location = ""
    @State var description = ""
    @State var confirmed = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 5) {
                Button(action: {
                    print("VERY URGENT")
                }) {
                    Text("VERY URGENT")
                        .frame(width: 250, height: 50, alignment: .center)
                        .font(.custom("Avenir", size: 20))
                        .background(Color.white)
                        .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                        .cornerRadius(30)
                        .clipped()
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.init(red: 8/255, green: 217/255, blue: 94/255), lineWidth: 2)
                    )
                }
                .padding(.top, -30)
                
                VStack(alignment: .leading, spacing: 10) {
                    Spacer()
                    Text("Name")
                        .font(.headline)
                    
                    TextField("Your name", text: $name)
                        .frame(width: 350, height: 45, alignment: .leading)
                        .padding(.leading, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                    )
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Desease")
                        .font(.headline)
                    
                    TextField("Desease", text: $disease)
                        .frame(width: 350, height: 45, alignment: .leading)
                        .padding(.leading, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                    )
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Location")
                        .font(.headline)
                    
                    TextField("Your location", text: $location)
                        .frame(width: 350, height: 50, alignment: .leading)
                        .padding(.leading, 20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                    )
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Description")
                        .font(.headline)
                    
                    TextField("Enter a short description of your desease.", text: $description)
                        .frame(width: 350, height: 60, alignment: .top)
                        .padding(.leading, 20)
                        .padding(.top, 15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                    )
                }
                
                NavigationLink(destination: DoctorListView(), isActive: self.$confirmed) {
                    Text("")
                }.hidden()
                
                Button(action: {
                    let details = ConsultationDetails(Name: self.name, Disease: self.disease, Location: self.location, Description: self.description)
                    
                    WebService.shared.addConsultation(details: details)
                    
                    self.confirmed = true
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
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Home", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: {
            print("Details")
        }) {
            HStack(spacing: 5) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .clipped()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.white)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .clipped()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.white)
                
                Image(systemName: "circle.fill")
                    .resizable()
                    .clipped()
                    .frame(width: 5, height: 5)
                    .foregroundColor(.white)
            }
        })
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}
