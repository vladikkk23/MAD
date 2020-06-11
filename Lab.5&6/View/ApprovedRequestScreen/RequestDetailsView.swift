//
//  RequestDetailsView.swift
//  Lab.5&6
//
//  Created by vladikkk on 30/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct RequestDetailsView: View {
    
    @State var name: String
    @State var desease: String
    @State var location: String
    @State var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Name")
                    .font(.headline)
                
                Text(name)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Desease")
                    .font(.headline)
                
                Text(desease)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Location")
                    .font(.headline)
                
                Text(location)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Description")
                    .font(.headline)
                
                Text(description)
                    .font(.custom("Avenir", size: 16))
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 380, alignment: .leading)
    }
}

struct RequestDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RequestDetailsView(name: "name", desease: "desease", location: "location", description: "description")
    }
}
