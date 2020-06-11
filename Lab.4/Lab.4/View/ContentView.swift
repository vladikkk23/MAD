//
//  ContentView.swift
//  Lab.4
//
//  Created by vladikkk on 17/10/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var value: CGFloat = 0
    
    var body: some View {
        CircularProgressBarContentView(value: $value)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CircularProgressBarContentView: View {
    @Binding var value: CGFloat
    @State var start = false
    @State var stop = true
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color.green, lineWidth:5)
                .frame(width:100)
                .rotationEffect(Angle(degrees:-90))
            Text(getPercentage(value))
            HStack(spacing: 100) {
                Button(action: {
                    self.start = true
                    self.stop = false
                    
                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
                        if (self.value >= 0.9 || self.stop) {
                            timer.invalidate()
                        } else {
                            self.value += 0.1
                        }
                    }
                }) {
                    Text("Start")
                        .foregroundColor(.green)
                        .font(.title)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.green, lineWidth: 5)
                        )
                }
                Button(action: {
                    self.start = false
                    self.stop = true
                    
                    Timer.scheduledTimer(withTimeInterval: 0.4, repeats: true) { timer in
                        self.value = 0
                        timer.invalidate()
                    }
                }) {
                    Text("Stop / Reset")
                        .foregroundColor(.red)
                        .font(.title)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.red, lineWidth: 5)
                        )
                }
            }
            .padding(.top, 700)
        }
    }
    
    func getPercentage(_ value: CGFloat) -> String {
        let intValue = Int(ceil(value * 100))
        return "\(intValue) %"
    }
}
