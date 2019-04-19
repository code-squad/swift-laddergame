//
//  Ladder.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    private var rows :[LadderRow]
    private var numOfSteps :Int
    private let height :Int
    
    init(_ rows:[LadderRow] = [LadderRow](), height:Int, numOfSteps:Int) {
        self.rows = [LadderRow].init(repeating: LadderRow.init(numOfSteps: numOfSteps), count: height)
        self.height = height
        self.numOfSteps = numOfSteps
        setRows()
    }
    public func getRows()->[LadderRow]{return self.rows}
    private mutating func setRows(){
        self.rows = self.rows.map{
            _ in
            return LadderRow.init(numOfSteps: self.numOfSteps )
        }
    }
 
}
