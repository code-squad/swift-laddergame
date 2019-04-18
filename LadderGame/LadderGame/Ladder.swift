//
//  Ladder.swift
//  LadderGame
//
//  Created by 이동영 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    private let rows :[LadderRow]
    init(_ rows:[LadderRow]) {
        self.rows = rows
    }
    public func getRows()->[LadderRow]{return self.rows}
 
}
