//
//  Ladder.swift
//  LadderGame
//
//  Created by 이동영 on 17/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

protocol Writeable{
    func toString()->String
}

struct Ladder:Writeable{
    let rows : [Row]
    func toString() -> String {
        self.rows.map{
            row in
            row.toS
        }
    }
}
