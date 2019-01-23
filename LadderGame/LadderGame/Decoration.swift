//
//  Decoration.swift
//  LadderGame
//
//  Created by cushy k on 23/01/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Decoration {
    enum Line {
        case step
        case nothing
        
        var description: String {
            switch self {
            case .step:
                return "------"
            case .nothing:
                return "      "
            }
        }
        
    }
}
