//
//  Output.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation
struct Output {
    func userInputValue() -> Int {
        
        let rawUserInputValue = readLine()
        
        guard rawUserInputValue == nil || (rawUserInputValue?.isEmpty ?? false) else {
            return 0
        }
        
        return Int(rawUserInputValue!) ?? 0
    }
}
