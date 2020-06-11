//
//  CustomBgImageView.swift
//  Lab.1
//
//  Created by vladikkk on 20/09/2019.
//  Copyright © 2019 vladikkk. All rights reserved.
//

import UIKit

class CustomBgImageView: UIImageView {
    
    //MARK : Initialization
    
    /*
     Setting background image depending on time.
     */
    override init(image: UIImage?) {
        super.init(image: image)
        
        self.setupImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    // MARK : Methods

    /*
     Setup the backgroung image.
     */
    private func setupImage() {
        let tp = CurrentTimePeryod.shared.currentTimeOfTheDay
        
        switch tp {
        case .Day:
            image = #imageLiteral(resourceName: "dayBg")
        case .Afternoon:
            image = #imageLiteral(resourceName: "afternoonBg")
        case .Night:
            image = #imageLiteral(resourceName: "nightBg")
        }
    }
}
