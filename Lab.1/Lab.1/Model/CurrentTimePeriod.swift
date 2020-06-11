//
//  CurrentTimePeriod.swift
//  Lab.1
//
//  Created by vladikkk on 20/09/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import Foundation

/*
 A singleton object, used to get the current time period of the day. (see 'TimeOfDayEnum' for available periods.)
 */
class CurrentTimePeryod {
    
    // MARK : Properties

    /*
     Singleton.
     */
    static let shared = CurrentTimePeryod()
    
    /*
     Describes the current time period of the day.
     */
    var currentTimeOfTheDay = TimeOfDayEnum.Day
    
    // MARK : Initialization
    private init() {
        getCurrentTime()
    }
    
    
    // MARK : Methods

    /*
     Setting the current time period of the day.
     */
    func getCurrentTime() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)

        if (hour < 5 || hour > 20) {
            self.currentTimeOfTheDay = TimeOfDayEnum.Night
        }
        else if(hour >= 5 && hour <= 16) {
            self.currentTimeOfTheDay = TimeOfDayEnum.Day
        }
        else {
            self.currentTimeOfTheDay = TimeOfDayEnum.Afternoon
        }
    }
}
