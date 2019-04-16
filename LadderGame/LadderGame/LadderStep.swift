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
    private let ladder: Bool
    
    init(ladder: Bool) {
        self.ladder = ladder
    }
    
    func convertLadderStep() -> String {
        if ladder == true {
            return LadderComponent.empty.rawValue
        }
        
        return LadderComponent.rung.rawValue
    }
}
