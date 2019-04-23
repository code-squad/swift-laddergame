//
//  LadderStep.swift
//  LadderGame
//
//  Created by JieunKim on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderStep {
    var isConnceted: Bool = false
    init() {
        self.isConnceted = makeRandomStep()
    }
    
    private func makeRandomStep() -> Bool {
        let randomStep = Bool.random()
        return randomStep
    }
}
