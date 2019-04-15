//
//  LadderStep.swift
//  LadderGame
//
//  Created by CHOMINJI on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    
    var hasStep: Bool = false
    
    init() {
        self.hasStep = makeRandomStep()
    }
    
    private func makeRandomStep() -> Bool {
        let randomStep = Bool.random()
        return randomStep
    }
    
    func drawStep() {
        self.hasStep ? print("-----", terminator: "|") : print("     ", terminator: "|")
    }
}

