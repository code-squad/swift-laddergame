//
//  LadderStep.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum StepType:String{
    case exist = "-----"
    case none = "     "
    
    func generateAfter()->(StepType){
        let before = self
        switch before {
        case .none:
            return getRandom()
        case .exist:
            return .none
        }
    }
    private func getRandom()->(StepType){
        return Bool.random() ? .exist : .none
    }
}
struct LadderStep{
    
    private let type:StepType
    private let pattern:String
    var description : String {
        return self.getPattern()
    }
    init(type:StepType = .none) {
        self.type = type
        self.pattern = type.rawValue
    }
    func getType()->(StepType){return self.type}
    func getPattern()->(String){return self.pattern}
    
}

