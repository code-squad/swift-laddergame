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
    private var _numberOfPlayers: Int = 0
    
    internal var names : [LadderPlayer]
    internal var ladder2dMap: [[Bool]]?
    
    internal var playerList: [LadderPlayer] {
        get {
            return names
        }
    }
    internal var height: Int {
        get{
            return _height
        }
        set(value){
            _height = value
        }
    }
    
    internal var numberOfPlayers: Int{
        get {
            return names.count - 1
        }set{
            _numberOfPlayers = names.count
        }
    }
    
    /// initializer
    init(){
        _height = 0
        names = [LadderPlayer]()
    }
    init(namesInput: [LadderPlayer]){
        self.init()
        names = namesInput
    }
    init( height: Int, namesInput: [LadderPlayer]){
        self.init(namesInput: namesInput)
        _height = height
        names = namesInput
    }
    
    /// internal functions
    private mutating func initLadder() -> Void {
        ladder2dMap = [[Bool]] (repeating: Array(repeating: false, count: numberOfPlayers), count: _height)
    }
    
    internal mutating func buildLadder() -> Void {
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
    
    internal mutating func appendPlayer(_ newPlayer: LadderPlayer) {
        names.append(newPlayer)
        _numberOfPlayers = _numberOfPlayers + 1
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
        return ladderRowMap.enumerated().map { (index: Int, element: Bool) -> Bool in
            let leastBoundIndex = 1
            if index >= leastBoundIndex && ladderRowMap[index] == true &&
                ladderRowMap[index-1] == ladderRowMap[index] {
                return false
            }
            return element
        }
    }
}
