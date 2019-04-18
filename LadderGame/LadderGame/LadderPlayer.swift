//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private let _name: String
    var nameLength: Int {
        get{
            return _name.count
        }
    }
    var name: String {
        return _name
    }
    
    init(_ name: String = ""){
        _name = name
    }
}
