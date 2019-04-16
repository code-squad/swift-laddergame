//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer {
    private(set) var _name: String
    internal var name: String {
        get {
            return _name
        }set(value) {
            _name = value
        }
    }
    init(){ _name = ""}
    init(_ name: String){
        _name = name
    }
}
