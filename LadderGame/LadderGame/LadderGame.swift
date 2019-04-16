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
    func makeRow(numOfSpan:Int)->[LadderStep]{
        var row = Row.init(repeating: .init(type: .none), count: numOfSpan)
        for index in 0..<numOfSpan{
            let type = row[index/2].getType().generate()
            row[index] = LadderStep.init(type: type.generate())
        }
        return row
    }
    func run(){
        
    }
    
}
