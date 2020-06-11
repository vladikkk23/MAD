//
//  WebService.swift
//  Lab.5&6
//
//  Created by vladikkk on 11/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import MapKit

class WebService: ObservableObject {
    
    var didChange = PassthroughSubject<WebService, Never>()
    var doctorsList: [DoctorData] = [] {
        didSet {
            didChange.send(self)
        }
    }
    var diChange = PassthroughSubject<Void, Never>()
    
    private let baseURL = URL(string: "http://81.180.72.17/api")!
    private var token: String = ""
    private let decoder = JSONDecoder()
    var authStatus = true
    
    static let shared = WebService()
    
    
    private init() {}
    
    struct APIResponse: Codable {
        let Status, Message: String?
    }
    
    func registerUser(newUser: UserReg) {
        let urlString = "http://81.180.72.17/api/Register/UserReg"
        
        guard let url = URL(string: urlString) else { return }
        
        let body = ["FullName" : newUser.fullName, "Birthday" : newUser.birthday, "Email" : newUser.email , "Phone" : newUser.phone, "Address" : newUser.address, "Username": newUser.username, "Password": newUser.password, "Base64Photo" : newUser.base64Photo]
        
        let jsonString = body.reduce("") { "\($0)\($1.0)=\($1.1)&" }
        let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                fatalError("An error ocurred: \(err)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            guard let resData = try? JSONDecoder().decode(APIResponse.self, from: data) else {
                let responseData = APIResponse(Status: "SUCCESS", Message: nil)
                
                print(responseData.Status!)
                
                return
            }
            
            print(resData.Status ?? "")
            print(resData.Message ?? "")
            
        }.resume()
    }
    
    func loginUser(userData: UserLogin) {
        
        let urlString = "http://81.180.72.17/api/Login/UserAuth"
        
        guard let url = URL(string: urlString) else { return }
        
        let body = ["Email" : userData.email ,"Password": userData.password]
        
        let jsonString = body.reduce("") { "\($0)\($1.0)=\($1.1)&" }
        let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, resp, err) in
            
            if let err = err {
                fatalError("An error ocurred: \(err)")
            }
            
            guard let response = resp as? HTTPURLResponse else {
                return
            }
            
            guard let data = data else { return }
            
            guard let resData = try? JSONDecoder().decode(APIResponse.self, from: data) else {
                print("ERROR")
                
                return
            }
            
            self.token = resData.Message!
            self.getDoctorList()
            
            print("Status Code: \(response.statusCode)")
            print(resData.Status ?? "")
            print(resData.Message ?? "EMPTY")
            
            
            if response.statusCode == 200 {
                self.authStatus = true
            }
            
        }.resume()
    }
    
    func getUserInfo() {
        let urlString = "http://81.180.72.17/api/Profile/GetProfile"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(self.token, forHTTPHeaderField: "Token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                fatalError("An error ocurred: \(err)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            guard let decodedResp = try? JSONDecoder().decode(UserData.self, from: data) else {
                print("ERROR!")
                
                return
            }
            
            print(decodedResp)
        }.resume()
    }
    
    func getDoctorList() {
        let urlString = "http://81.180.72.17/api/Doctor/GetDoctorList"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(self.token, forHTTPHeaderField: "Token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                fatalError("An error ocurred: \(err)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            
            guard let decodedResp = try? decoder.decode([DoctorWebData].self, from: data) else {
                print("ERROR!")
                
                return
            }
            
            for doc in decodedResp {
                let image = UIImage(data: doc.Photo)
                let geocoder = CLGeocoder()
                var coordinates = CLLocationCoordinate2D()
                
                geocoder.geocodeAddressString(doc.Address) { (placemarks, error) in
                    
                    if error != nil {
                        print("No such address!")
                    } else if let placemarks = placemarks {
                        
                        if let coordinate = placemarks.first?.location?.coordinate {
                            coordinates = coordinate
                        }
                    }
                }
                
                DispatchQueue.main.async {
                    self.doctorsList.append(DoctorData(id: doc.DocId, fullname: doc.FullName, rank: doc.Stars, speciality: doc.Specs, description: doc.About, address: doc.Address, coordinates: coordinates, image: image ?? UIImage(systemName: "person")!))
                }
            }
            
            print(decodedResp)
        }.resume()
    }
    
    func getDoctorById(id: Int) {
        let urlString = "http://81.180.72.17/api/Doctor/GetDoctor/\(id)"
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(self.token, forHTTPHeaderField: "Token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                fatalError("An error ocurred: \(err)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .secondsSince1970
            
            guard let decodedResp = try? decoder.decode(DoctorWebData.self, from: data) else {
                print("ERROR!")
                
                return
            }
            
            print(decodedResp)
        }.resume()
    }
    
    func addConsultation(details: ConsultationDetails) {
        let urlString = "http://81.180.72.17/api/Doctor/AddConsultation"
        
        guard let url = URL(string: urlString) else { return }
        
        let body = ["Name" : details.Name, "Disease" : details.Disease, "Address" : details.Location , "Description" : details.Description ?? "NULL"]
        
        let jsonString = body.reduce("") { "\($0)\($1.0)=\($1.1)&" }
        let jsonData = jsonString.data(using: .utf8, allowLossyConversion: false)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue(self.token, forHTTPHeaderField: "Token")
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let err = error {
                fatalError("An error ocurred: \(err)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("Status Code: \(response.statusCode)")
            }
            
            guard let data = data else { return }
            
            guard let respData = try? JSONDecoder().decode(ConsultationResponse.self, from: data) else {
                print("ERROR!")
                
                return
            }
            
            print(respData)
            
        }.resume()
    }
}
