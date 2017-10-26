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
    
    func drawLadder(col colNum: Int, row rowNum: Int) -> String{
        var result: String = ""
        
        for _ in 1...rowNum {
            result += drawCols(col: colNum).joined() + "\n"
        }
        
        return result
    }
    
    private func drawCols(col colNum: Int) -> [String] {
        var cols: [String] = []
        
        for i in 1..<colNum*2 {
            cols.append(drawBar(colNum: i))
        }
        
        return cols
    }
    
    private func drawBar(colNum num: Int) -> String {
        guard num % 2 == 0  else {
            return sidebar
        }
        
        return arc4random_uniform(2) == 0 ? blank : horizontalBar
    }
}
