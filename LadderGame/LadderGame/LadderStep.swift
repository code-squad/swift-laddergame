//
//  LadderStep.swift
//  LadderGame
//
//  Created by 이진영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    private let ladder: Bool
    
    init(ladder: Bool) {
        self.ladder = ladder
    }
    
    func convertLadderStep() -> String {
        if ladder == true {
            return "-----"
        }
        
        return "     "
    }
}
