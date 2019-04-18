//
//  LadderRow.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderRow{
   private let steps : [LadderStep]
    var description : [String] {
        return self.steps.map{
            return $0.getPattern()
        }
    }
    
    init(_ steps:[LadderStep]) {
        self.steps = steps
    }
    
    public func getSteps()->[LadderStep]{ return self.steps }
}
