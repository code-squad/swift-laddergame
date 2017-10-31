//
//  Ladder.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    var column: Int
    var row: Int
    private(set) var ladder: String = ""
    private let horizontalBar: String = "-----"
    private let sidebar: String = "ㅣ"
    private let blank: String = "     "
    
    init(column: Int, row: Int) {
        self.column = column
        self.row = row
    }
    
    private init(column: Int, row: Int, ladder: String) {
        self.column = column
        self.row = row
        self.ladder = ladder
    }
    
    func makeLadder() -> Ladder {
        var _ladder: String = ""
        
        for _ in 1...row {
            _ladder += makeALine().joined() + "\n"
        }
        
        return Ladder(column: column, row: row, ladder: _ladder)
    }
    
    private func makeALine() -> [String] {
        var oneLine: [String] = []
        
        for i in 1..<column*2 {
            oneLine.append(makeBar(i))
        }
        
        return oneLine
    }
    
    private func makeBar(_ number: Int) -> String {
        guard number % 2 == 0  else {
            return sidebar
        }
        
        return arc4random_uniform(2) == 0 ? blank : horizontalBar
    }
}
