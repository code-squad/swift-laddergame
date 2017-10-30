//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 30..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    var name: String = ""
    
    var isExceedLength: Bool {
        if (self.name.count <= 0 || self.name.count >= 6) {
            return false
        }
        
        return true
    }
}
