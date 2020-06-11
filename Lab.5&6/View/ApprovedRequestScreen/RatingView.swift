//
//  RatingView.swift
//  Lab.5&6
//
//  Created by vladikkk on 30/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @State var rating: Float
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            Image(systemName: "star.fill")
                .foregroundColor(Color.yellow)
            
            Text(rating.description)
                .padding(.leading, 15)
                .foregroundColor(.secondary)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4.9)
    }
}
