//
//  LadderRow.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderRow: CustomStringConvertible{
   
   private var steps : [LadderStep]
    var description : String {
        return self.steps.map{
            return $0.getPattern()
        }.description
    }
   
    init(numOfSteps:Int ) {
        self.steps = [LadderStep].init(repeating: LadderStep.init(), count: numOfSteps)
        setSteps()
    }
    public func getSteps()->[LadderStep]{
        return self.steps
    }
    private mutating func setSteps(){
        var beforeType:StepType = .none
        self.steps = self.steps.map{
            step in
            let type = beforeType.generateAfter()
            beforeType = type
            return LadderStep.init(type: type)
        }
    }
}
