//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by rhino Q on 2018. 3. 13..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer{
    private var _name : String = ""
    var name: String {
        set { _name = newValue }
        get { return _name }
    }
}
