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
typealias LadderInfo = ([LadderPlayer],Int)


struct LadderGame{
    
    func input() throws ->(LadderInfo){
        let inputView = InputView()
        return try inputView.run()
    }
    func makeLadder(_ info:LadderInfo)->[Row]{
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
        var beforeType:StepType = .none
        for index in 0..<numOfSpan{
            row[index] = LadderStep.init(type: beforeType.generateAfter())
            beforeType = row[index].getType()
        }
        return row
    }
    func output(_ ladder:[Row],players:[LadderPlayer]){
        let outputView = OutputView()
        outputView.outputAll(players: players, ladder: ladder)
    }
    func run() {
        var isError = false
        repeat{
            do{
                let info = try input()
                output(makeLadder(info), players: info.0)
                isError = false
            }catch ErrorType.outOfRange{
                alertErrorMessage(type: ErrorType.outOfRange)
                isError = true
            }catch ErrorType.wrongInput{
                alertErrorMessage(type: ErrorType.wrongInput)
                isError = true
            }catch {
                alertErrorMessage()
                isError = true
            }
        }while isError
    }
}
