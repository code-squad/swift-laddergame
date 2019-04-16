//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer{
    private let name : String
    
    init(name:String) {
        self.name = name
    }
    public func getName()->(String){return self.name}
}
