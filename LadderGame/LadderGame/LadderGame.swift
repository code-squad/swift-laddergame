//
//  LadderGame.swift
//  LadderGame
//
//  Created by moon on 2018. 3. 23..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var names: [LadderPlayer]
    
    var ladder: [[LadderStep]] = {
        
    }
    
    init(names: [LadderPlayer], height: Int) {
        self.names = names
        self.height = height
    }
    
    private func generateRandom() -> Bool {
        return arc4random_uniform(2) == 1
    }
    
    private func makeStep() -> [LadderStep] {
        var steps = [LadderStep]()
        for _ in 1..<self.names.count {
            steps.append(LadderStep(step: generateRandom()))
        }
        
        return steps
    }
    
    func makeLadder() -> [[LadderStep]] {
        var ladder = [[LadderStep]]()
        
        for _ in 0..<self.height {
            ladder.append(makeStep())
        }
        
        return ladder
    }
}
