//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 심 승민 on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer{
    let name: String
    var isNameOverMaxCount: Bool{
        // 넘지 않으면 false
        guard self.name.count > 6 else { return false }
        // 넘으면 true
        return true
    }
}
