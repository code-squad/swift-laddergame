//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private var name: String
    
    init() {
        name = ""
    }
    
    mutating func setName(name: String){
        self.name = name
    }
    
    func getName() -> String{
        return name
    }
    
}
