//
//  LadderGame.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct LadderGame {
    internal var _height = 0
    var height: Int {
        get{
            return _height
        }
        set(value){
            _height = value
        }
    }
    var names : [LadderPlayer]
    var numberOfPlayers: Int{
        get {
            return names.count
        }
    }
    
//    var _maxSizeOfPlayerName: Int
//    var maxSizeOfPlayerName: Int{
//        get{
//            var maxLengthOfName = 0
//            for nameItem in names {
//                if maxLengthOfName < nameItem.name.count {
//                    maxLengthOfName = nameItem.name.count
//                }
//            }
//            return maxLengthOfName
//        }
//    }
}
