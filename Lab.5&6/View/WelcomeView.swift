//
//  WelcomeView.swift
//  Lab.5&6
//
//  Created by vladikkk on 17/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 100) {
                
                VStack(alignment: .center, spacing: 20) {
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding()
                        .allowsTightening(true)
                }
                
                VStack(spacing: 40) {
                    NavigationLink(destination: RegistrationView()) {
                        Text("Sign Up")
                            .frame(width: 330, height: 50, alignment: .center)
                            .font(.custom("Avenir", size: 20))
                            .background(Color.white)
                            .foregroundColor(.init(red: 8/255, green: 217/255, blue: 94/255))
                            .cornerRadius(20)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .frame(width: 330, height: 50, alignment: .center)
                            .font(.custom("Avenir", size: 20))
                            .background(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .clipped()
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color.white, lineWidth: 2)
                        )
                    }
                }
                
                Button(action: {
                    print("URGENT")
                }) {
                    HStack {
                        Text("URGENT")
                            .font(.custom("Avenir", size: 20))
                            .foregroundColor(.white)
                    }
                }
            }
            .background(
                Image("background")
                    .frame(minWidth: 750, idealWidth: 750, maxWidth: 800, minHeight: 1334, idealHeight: 1334, maxHeight: 1334, alignment: .center))
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
