//
//  RegistrationView.swift
//  Lab.5&6
//
//  Created by vladikkk on 26/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var fullName: String = ""
    @State var birthday: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var address: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var base64Photo: String = ""
        
    @State private var showingAlert = false
    @State var registered = false

    var body: some View {
        NavigationView {
            ScrollView {
                Button(action: {
                    print("Select Image")
                }) {
                    Image("registrationImage")
                        .renderingMode(.original)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 150, height: 150)
                        .padding()
                }
                
                VStack(alignment: .center, spacing: 30) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Full Name")
                            .font(.headline)
                        
                        TextField("Your Full name", text: $fullName)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.name)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Birthday")
                            .font(.headline)
                        
                        TextField("yyyy/MM/dd", text: $birthday)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Email")
                            .font(.headline)
                        
                        TextField("Your Email", text: $email)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.emailAddress)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Username")
                            .font(.headline)
                        
                        TextField("Your Username", text: $username)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.username)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Password")
                            .font(.headline)
                        
                        TextField("Your Password", text: $password)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.newPassword)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Phone Number")
                            .font(.headline)
                        
                        TextField("Your Phone Number", text: $phone)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.telephoneNumber)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Location/Adress")
                            .font(.headline)
                        
                        TextField("Your Location", text: $address)
                            .frame(width: 350, height: 50, alignment: .center)
                            .padding(.leading, 20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.init(red: 200/255, green: 211/255, blue: 214/255), lineWidth: 1.5)
                        )
                            .textContentType(.addressCityAndState)
                    }
                    
                    VStack {
                        NavigationLink(destination: HomeScreenView(), isActive: self.$registered) {
                            Text("")
                        }.hidden()
                        
                        Button(action: {
                            self.register()
                        }) {
                            Text("Register")
                                .frame(width: 350, height: 50, alignment: .center)
                                .font(.custom("Avenir", size: 20))
                                .background(Color.init(red: 8/255, green: 217/255, blue: 94/255))
                                .foregroundColor(.white)
                                .cornerRadius(20)
                                .clipped()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color.clear, lineWidth: 0)
                            )
                        }
                        .alert(isPresented: $showingAlert) {
                            Alert(title: Text("Registration Failed"), message: Text("Registration Failed due to incorrect data. Please check all fields are completed correctly and try again."), dismissButton: .default(Text("Try Again")))
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Register", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.left")
                .resizable()
                .clipped()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
        })
    }
    
    private func register() {
        WebService.shared.registerUser(newUser: UserReg(fullName: self.fullName, birthday: self.birthday, email: self.email, phone: self.phone, address: self.address, username: self.username, password: self.password, base64Photo: self.base64Photo))
        
        if self.fullName.isEmpty {
            self.registered = false
        }
        
        if self.birthday.isEmpty {
            self.registered = false
        }
        
        if self.email.isEmpty {
            self.registered = false
        }
        
        if self.phone.isEmpty {
            self.registered = false
        }
        
        if self.address.isEmpty {
            self.registered = false
        }
        
        if self.username.isEmpty {
            self.registered = false
        }
        
        if self.password.isEmpty {
            self.registered = false
        } else {
            self.registered = true
        }
        
        if !self.registered {
            self.showingAlert = true
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
