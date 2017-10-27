//
//  view.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Input {
    let col: String
    let row: String
    
    var colNumber: Int {
        return changeIntegerType(col)
    }
    
    var rowNumber: Int {
        return changeIntegerType(row)
    }
    
    func confirmInputValue() -> Bool {
        if col.isEmpty || row.isEmpty  {
            return false
        }
        
        if isNumber(col) || isNumber(row) {
            return false
        }
        
        return true
    }
    
    private func changeIntegerType(_ inputValue: String) -> Int {
        return Int(inputValue) ?? 0
    }
    
    private func isNumber(_ inputValue: String) -> Bool {
        guard changeIntegerType(inputValue) == 0 else {
            return false
        }
    
        return true
    }
}
