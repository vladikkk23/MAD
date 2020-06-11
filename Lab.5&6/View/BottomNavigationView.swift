//
//  BottomNavigationView.swift
//  Lab.5&6
//
//  Created by vladikkk on 29/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct BottomNavigationView: View {
    
    var line: some View {
        VStack {
            Divider()
                .background(Color.gray)
        }
        .padding(.vertical)
        .shadow(color: .black, radius: 3, x: 0, y: -3)
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: -75) {
            line
                .padding(.bottom, 50)
            HStack(alignment: .center, spacing: 22) {
                
                Button(action: {
                    print("Home")
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "house")
                            .resizable()
                            .clipped()
                            .frame(width: 25, height: 20)
                            .foregroundColor(.black)
                        
                        Text("Home")
                                .frame(width: 50, height: 20, alignment: .center)
                                .font(.custom("Avenir", size: 13))
                                .background(Color.white)
                                .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                    }
                }
                
                Button(action: {
                    print("Notification")
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "bell")
                            .resizable()
                            .clipped()
                            .frame(width: 20, height: 22)
                            .foregroundColor(.black)

                        Text("Notification")
                                .frame(width: 70, height: 20, alignment: .center)
                                .font(.custom("Avenir", size: 13))
                                .background(Color.white)
                                .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                    }
                }
                
                VStack(alignment: .center) {
                    Button(action: {
                        print("Add")
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .clipped()
                            .frame(width: 55, height: 55)
                            .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                            .background(Color.white)
                            .cornerRadius(100)
                            .overlay(
                                RoundedRectangle(cornerRadius: 100)
                                    .stroke(Color.init(red: 8/255, green: 217/255, blue: 94/255), lineWidth: 2)
                            )
                    }
                }
                .padding(.bottom, 35)
                
                Button(action: {
                    print("Home")
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "calendar")
                        .resizable()
                        .clipped()
                        .frame(width: 25, height: 20)
                        .foregroundColor(.black)

                        Text("Schedule")
                                .frame(width: 60, height: 20, alignment: .center)
                                .font(.custom("Avenir", size: 13))
                                .background(Color.white)
                                .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                    }
                }
                                    
                Button(action: {
                    print("Home")
                }) {
                    VStack(spacing: 5) {
                        Image(systemName: "person")
                            .resizable()
                            .clipped()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                        
                        Text("Profile")
                                .frame(width: 50, height: 20, alignment: .center)
                                .font(.custom("Avenir", size: 13))
                                .background(Color.white)
                                .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                                .cornerRadius(10)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.white, lineWidth: 2)
                                )
                    }
                }
            }
        }
    }
}

struct BottomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigationView()
    }
}
