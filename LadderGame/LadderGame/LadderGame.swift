//
//  ladderGame.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private let horizontalBar: String = "-"
    private let sidebar: String = "ㅣ"
    private let blank: String = " "
    
    func drawLadder(column columnNumber: Int, row rowNumber: Int) -> String{
        var result: String = ""
        
        for _ in 1...rowNumber {
            result += drawCols(column: columnNumber).joined() + "\n"
        }
        
        return result
    }
    
    private func drawCols(column columnNumber: Int) -> [String] {
        var columns: [String] = []
        
        for i in 1..<columnNumber*2 {
            columns.append(drawBar(columnNumber: i))
        }
        
        return columns
    }
    
    private func drawBar(columnNumber number: Int) -> String {
        guard number % 2 == 0  else {
            return sidebar
        }
        
        return arc4random_uniform(2) == 0 ? blank : horizontalBar
    }
}
