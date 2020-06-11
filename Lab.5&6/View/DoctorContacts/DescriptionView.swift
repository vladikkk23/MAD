//
//  DescriptionView.swift
//  Lab.5&6
//
//  Created by vladikkk on 10/12/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct DescriptionView: View {
    
    @State var description: String
    @State var address: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Short Description")
                .font(.headline)
            
            Text(self.description)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .multilineTextAlignment(.leading)
                .allowsTightening(true)
            
            Text("Address")
                .font(.headline)
            
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
        .padding()
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." , address: "Address")
    }
}
