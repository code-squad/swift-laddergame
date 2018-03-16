//
//  validChecker.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 16..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ValidChecker {
    static func checkHeight(_ rawInputValue:String?) -> Int {
        guard let rawInputValue = rawInputValue, !rawInputValue.isEmpty else {
            return 0
        }
        return Int(rawInputValue) ?? 0
    }
}
