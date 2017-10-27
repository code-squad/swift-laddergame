//
//  Ladder.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    let column: String
    let row: String
    
    var property: (Int, Int) {
        get {
            guard confirmInputValue() else {
                return (0, 0)
            }
            
            return (changeIntegerType(column), changeIntegerType(row))
        }
    }
    
    private func changeIntegerType(_ inputValue: String) -> Int {
        return Int(inputValue) ?? 0
    }
    
    private func confirmInputValue() -> Bool {
        if column.isEmpty || row.isEmpty  {
            return false
        }
        
        if isNumber(column) || isNumber(row) {
            return false
        }
        
        return true
    }
    
    private func isNumber(_ inputValue: String) -> Bool {
        guard changeIntegerType(inputValue) == 0 else {
            return false
        }
        
        return true
    }
}
