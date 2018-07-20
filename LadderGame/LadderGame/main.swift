//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    let players = InputView.getPlayers()
    if let height = InputView.getLadder() {
        let ladderElements = LadderGame.init(names: players, height: height)
        
        let ladders:[[LadderStep]] = makeLadder(elements: ladderElements)
        
        var result = ResultView()
        result.setLadders(elements: ladders)
        result.printLadders()
        result.printPlayer(elements: ladderElements)
    }
    
}

// 사다리 발판 값을 변경하는 함수
func switchHaveLadderValue(value:Int) -> Int {
    // only : 0 or 1
    return value == 0 ? 1 : 0
}

// 검증 하는 함수
func verifyDuplication(first:LadderStep, second:LadderStep, select:Int) -> LadderStep {
    let ladderStep:LadderStep = .have
    return first == ladderStep && second == ladderStep ? haveHorizontalLadder(have: Int(select)) : haveHorizontalLadder(have: select)
}

// 사다리의 층 만드는 함수
func makeStep( elements: Int) -> Array<LadderStep> {
    
    var step = Array<LadderStep>()
    step.append(LadderStep.default)
    
    for _ in 1..<elements {
        let select = Int(arc4random_uniform(2))

        let lastElement = step.last
        let newElement = haveHorizontalLadder(have: Int(select))

        step.append(verifyDuplication(first: lastElement!, second: newElement, select: select))
    }

    return step
}

// 사다리 만드는 함수
func makeLadder(elements:LadderGame) -> [[LadderStep]] {
    var ladders = [[LadderStep]]()
    
    for _ in 0..<elements.height {
        ladders.append(makeStep(elements: elements.names.count))
    }
    
    return ladders
}

// 사다리 유무 정하는 함수
func haveHorizontalLadder(have:Int) -> LadderStep {
    // only : 0 or 1
    return have == 1 ? LadderStep.have : LadderStep.none
}

main()
