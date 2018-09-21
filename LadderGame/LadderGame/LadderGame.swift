//
//  LadderGame.swift
//  LadderGame
//
//  Created by 조재흥 on 2018. 9. 20..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var height = 0
    var names = [LadderPlayer]()
    
    init(height:Int, names:String) {
        self.height = height
        for i in names.split(separator: ",") {
            self.names.append(LadderPlayer(name: String(i)))
        }
    }
    
}
