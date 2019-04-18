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
    internal var nameLength: Int {
        get{
            return _name.count
        }
    }
    internal var nameTobePrinted: String {
        get {
            let printedName: String
            switch nameLength{
            case 1:
                printedName = "  "+_name+"  "
            case 2:
                printedName = "  "+_name+" "
            case 3:
                printedName = " "+_name+" "
            case 4:
                printedName = _name+" "
            case 5:
                printedName = _name
            default:
                printedName = _name
            }
            return printedName
        }
    }
    init(){ _name = ""}
    init(_ name: String){
        _name = name
    }
}
