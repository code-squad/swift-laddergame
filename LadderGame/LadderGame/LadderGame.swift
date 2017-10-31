//
//  ladderGame.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var names: [LadderPlayer]
    
    private init(names: [LadderPlayer]) {
        self.names = names
    }
    
    var playerNames: [LadderPlayer] {
        get {
            return names
        }
    }
    
    static func startGame(userNames inputNames: String, ladderHeight inputHeight: String) -> (Ladder?, LadderGame?) {
        // 이름 검사
        let userNames: Array = inputNames.split(separator: ",")
        var playerNames: [LadderPlayer] = []
        
        for i in 0..<userNames.count {
            let name = confirmName(userNames[i].description)
            if name == "" { continue }
            playerNames.append(LadderPlayer(name: name))
        }
        
        // 행,열 숫자 검사
        let columnNumber: Int = playerNames.count
        let rowNumber: Int = Int(inputHeight) ?? 0
        
        guard (isZero(columnNumber) && isZero(rowNumber)) else {
            return (nil, nil)
        }
    
        return (Ladder(column: columnNumber, row: rowNumber).makeLadder(), LadderGame(names: playerNames))
    }
    
    private static func confirmName(_ name: String) -> String{
        guard LadderPlayer(name: name).isExceedLength else { return "" }
        return name
    }
    
    private static func isZero(_ number: Int) -> Bool {
        guard number != 0 else {
            return false
        }
        
        return true
    }
}
