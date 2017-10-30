//
//  Ladder.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Ladder {
    let _horizontalBar: String = "-----"
    let _sidebar: String = "ㅣ"
    let _blank: String = "     "
    
    var sidebar: String {
        get {
            return self._sidebar
        }
    }
    
    var horizontalBar: String {
        get {
            return self._horizontalBar
        }
    }
    
    var blank: String {
        get {
            return self._blank
        }
    }
}
