//
//  LadderGame.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    /// Properties
    private var _height = 0
    private var _names : [LadderPlayer]
    var ladder2dMap: [[Bool]]?
    
    var playerList: [LadderPlayer] {
        get {
            return _names
        }
    }
    var height: Int {
        get{
            return _height
        }
        set(value){
            _height = value
        }
    }
    
    /// initializer
    init(){
        _height = 0
        _names = [LadderPlayer]()
    }
    init(namesInput: [LadderPlayer]){
        self.init()
        _names = namesInput
    }
    init( height: Int, namesInput: [LadderPlayer]){
        self.init(namesInput: namesInput)
        _height = height
        _names = namesInput
    }
    
    /// internal functions
    private mutating func initLadder() -> Void {
        ladder2dMap = [[Bool]] (repeating: Array(repeating: false, count: _names.count - 1), count: _height)
    }
    
    mutating func buildLadder() -> Void {
        initLadder()
        guard let ladder2dMap = self.ladder2dMap else{
            return
        }
        var resultLadder2dMap = ladder2dMap
        for (rowIndex, rowItems) in ladder2dMap.enumerated() {
            resultLadder2dMap[rowIndex] = buildRandomLadder(rowItems)
            resultLadder2dMap[rowIndex] = eraseHorizonLadderByRule(resultLadder2dMap[rowIndex])
        }
        self.ladder2dMap = resultLadder2dMap
    }
    
    mutating func appendPlayer(_ newPlayer: LadderPlayer) {
        _names.append(newPlayer)
    }
    
    ///private functions
    private func binaryRandomGenerate() -> Bool {
        let binaryRange:UInt32 = 2
        return (Int(arc4random_uniform(binaryRange))) == 0 ? false : true
    }
    private func buildRandomLadder(_ ladderRowMap: [Bool]) -> [Bool] {
        return ladderRowMap.enumerated().map{ (index: Int, element: Bool) -> Bool in
            var ret = element
            ret =  binaryRandomGenerate() ? true : false
            return ret
        }
    }
    private func eraseHorizonLadderByRule(_ ladderRowMap: [Bool]) -> [Bool] {
        let leastBoundIndex = 1
        let finedLadderMap =  ladderRowMap.enumerated().map { (index: Int, element: Bool) -> Bool in
            (index >= leastBoundIndex && ladderRowMap[index] == true && ladderRowMap[index-1] == ladderRowMap[index]) ? false : element
        }
        return finedLadderMap
    }
}
