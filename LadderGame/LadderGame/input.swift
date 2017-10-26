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
    
    var colNum: Int {
        return Int(col) ?? 0
    }
    
    var rowNum: Int {
        return Int(row) ?? 0
    }
}
