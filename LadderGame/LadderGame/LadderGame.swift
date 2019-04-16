//
//  LadderGame.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

typealias Row = [LadderStep]
typealias Height = Int

struct LadderGame{
    
    func input() throws ->(LadderInfo){
        let view = InputView()
        return try view.getLadderInfo()
    }
    func makeLadder(info:LadderInfo)->[Row]{
        let (players , height) = info
        let numOfSpan = players.count-1
        var ladder = [Row]()
        for _ in 0..<height{
            ladder.append(makeRow(numOfSpan: numOfSpan))
        }
        return ladder
    }
    func makeRow(numOfSpan:Int)->(Row){
        var row = Row.init(repeating: .init(type: .none), count: numOfSpan)
        for index in 0..<numOfSpan{
            let type = row[index/2].getType().generate()
            row[index] = LadderStep.init(type: type.generate())
        }
        return row
    }
    func run(){}
    
}
