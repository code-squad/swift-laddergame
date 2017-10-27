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
    
    func drawLadder(col colNumber: Int, row rowNumber: Int) -> String{
        var result: String = ""
        
        for _ in 1...rowNumber {
            result += drawCols(col: colNumber).joined() + "\n"
        }
        
        return result
    }
    
    private func drawCols(col colNumber: Int) -> [String] {
        var cols: [String] = []
        
        for i in 1..<colNumber*2 {
            cols.append(drawBar(colNumber: i))
        }
        
        return cols
    }
    
    private func drawBar(colNumber number: Int) -> String {
        guard number % 2 == 0  else {
            return sidebar
        }
        
        return arc4random_uniform(2) == 0 ? blank : horizontalBar
    }
}
