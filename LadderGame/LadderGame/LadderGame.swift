//
//  ladderGame.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private(set) var names: [LadderPlayer]
    private(set) var column: Int
    private(set) var row: Int
    
    private init(names: [LadderPlayer], column: Int, row: Int) {
        self.names = names
        self.column = column
        self.row = row
    }
    
    static func prepareGame(userNames inputNames: String, ladderHeight inputHeight: String) -> Result {
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
            return Result(status: false, message: "사용자 수나 사다리 높이를 다시 확인하세요.", ladderGame: nil)
        }
        
        let ladderGame = LadderGame(names: playerNames, column: columnNumber, row: rowNumber)
        
        return Result(status: ladderGame.startGame().status, message: ladderGame.startGame().ladder, ladderGame: ladderGame)
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
    
    private func startGame() -> (status: Bool, ladder: String) {
        var ladder: String = ""
        
        for _ in 1...row {
            ladder += makeALine().joined() + "\n"
        }
        
        return (true, ladder)
    }
    
    private func makeALine() -> [String] {
        var oneLine: [String] = []
        
        for i in 1..<column*2 {
            oneLine.append(makeBar(i))
        }
        
        return oneLine
    }
    
    private func makeBar(_ number: Int) -> String {
        let ladder: Ladder = Ladder()
        guard number % 2 == 0  else {
            return ladder.sidebar
        }
        
        return arc4random_uniform(2) == 0 ? ladder.blank : ladder.horizontalBar
    }
}
