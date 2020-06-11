//
//  LoginView.swift
//  Lab.5&6
//
//  Created by vladikkk on 24/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var showingAlert = false
    @State var authStatus = false
    
    var body: some View {
        NavigationView {
            VStack {
                VStack(spacing: 100) {
                    Text("Telemedicine")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .center , spacing: 75) {
                        VStack {
                            HStack {
                                Image(systemName: "person")
                                    .padding()
                                    .foregroundColor(.white)
                                
                                TextField("Email Address", text: $email)
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("Avenir", size: 18))
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                                .padding()
                            
                            HStack {
                                Image(systemName: "lock")
                                    .padding()
                                    .foregroundColor(.white)
                                
                                TextField("Password", text: $password)
                                    .foregroundColor(Color.white)
                                    .font(Font.custom("Avenir", size: 18))
                                    .textContentType(.password)
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 1)
                            )
                                .padding()
                        }
                        
                        VStack(spacing: 60) {
                            
                            NavigationLink(destination: HomeScreenView(), isActive: self.$authStatus) {
                                Text("")
                            }.hidden()
                            
                            Button(action: {
                                DispatchQueue.main.async {
                                    self.login()
                                }
                            }) {
                                Text("Login")
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
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Login Failed"), message: Text("Nice try, Mr. Hacker!"), dismissButton: .default(Text("Try Again")))
                            }
                            
                            NavigationLink(destination: RegistrationView()) {
                                Text("SIGNUP")
                                    .frame(width: 330, height: 50, alignment: .center)
                                    .font(.custom("Avenir", size: 20))
                                    .foregroundColor(.white)
                                    .cornerRadius(20)
                                    .clipped()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 40)
                                            .stroke(Color.white, lineWidth: 0)
                                )
                            }
                        }
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
    
    private func login() {
        WebService.shared.loginUser(userData: UserLogin(email: self.email, password: self.password))
        
        self.authStatus = WebService.shared.authStatus
        
        if !self.authStatus {
            self.showingAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    
    static var previews: some View {
        LoginView()
    }
}
