//
//  LadderStep.swift
//  LadderGame
//
//  Created by oingbong on 2018. 7. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

enum LadderStep {
    case `default`
    case have
    case none
    
    func description() -> String {
        switch self {
        case .default:
            return "  |"
        case .have:
            return "-----|"
        case .none:
            return "     |"
        }
    }
}
