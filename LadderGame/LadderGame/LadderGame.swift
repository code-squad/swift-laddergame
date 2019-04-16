//
//  LadderGame.swift
//  LadderGame
//
//  Created by hw on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


struct LadderGame {
    private var _height = 0
    internal var names : [LadderPlayer]
    // get set for private _height
    internal var height: Int {
        get{
            return _height
        }
        set(value){
            _height = value
        }
    }
    
    init(){
        _height = 0
        names = [LadderPlayer]()
    }
    init( names: [LadderPlayer]){
        self.names = names
    }
    init( height: Int, names: [LadderPlayer]){
        _height = height
        self.names = names
    }
    internal var numberOfPlayers: Int{
        get {
            return names.count
        }
    }
    
    internal func initLadder(numberOfPeople: Int, numberOfLadders: Int) -> [[Bool]] {
        let initialLadder = [[Bool]] (repeating: Array(repeating: false, count: numberOfPeople), count: numberOfLadders)
        return initialLadder
    }
    internal func buildLadder(ladder2dMap: [[Bool]]) -> [[Bool]] {
        var resultLadder2dMap = ladder2dMap
        for (rowIndex, rowItems) in ladder2dMap.enumerated() {
            resultLadder2dMap[rowIndex] = buildRandomLadder(rowItems)
            resultLadder2dMap[rowIndex] = eraseHorizonLadderByRule(resultLadder2dMap[rowIndex])
        }
        return resultLadder2dMap
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
    /// 연속해서 |-|-| 나오지 않도록 적용
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





