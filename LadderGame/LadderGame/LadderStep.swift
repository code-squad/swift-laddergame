//
//  LadderStep.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum LadderComponent: String {
    case empty = "     "
    case rung = "-----"
}

struct LadderStep {
    private(set) var component = false
    
    mutating func changeComponent(component: Bool) {
        self.component = component
    }
    
    func convertLadderStep() -> String {
        if component == true {
            return LadderComponent.empty.rawValue
        }
        
        return LadderComponent.rung.rawValue
    }
}
