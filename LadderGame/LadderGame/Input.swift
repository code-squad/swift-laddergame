//
//  view.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Input {
    static func askInputValue(_ question: String, _ terminator: String) -> String? {
        print(question, terminator: terminator)
            
        guard let value = readLine() else {
            return nil
        }
        
        return value
    }
}
