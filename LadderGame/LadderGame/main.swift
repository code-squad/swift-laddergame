//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main(){
    let input = InputView()
    
    let ladderElements = LadderGame.init(names: input.getPerson(), height: input.getLadder())
    
    let ladders:[[LadderStep.Step]] = makeLadder(elements: ladderElements)
    
    var result = ResultView()
    result.setLadders(elements: ladders)
    result.printLadders()
    result.printPlayer(elements: ladderElements)
}



// 사다리 발판 값을 변경하는 함수
func switchHaveLadderValue(value:Int) -> Int {
    // only : 0 or 1
    guard value == 0 else {
        return 0
    }
    return 1
}

// 검증 하는 함수
func verifyDuplication(first:LadderStep.Step, second:LadderStep.Step, select:Int) -> LadderStep.Step {
    guard first == LadderStep.Step.have && second == LadderStep.Step.have else {
        return haveHorizontalLadder(have: select)
    }
    return haveHorizontalLadder(have: switchHaveLadderValue(value: Int(select)))
}

// 사다리의 층 만드는 함수
func makeStep( element: Int) -> Array<LadderStep.Step> {

    var step = Array<LadderStep.Step>()
    step.append(LadderStep.Step.default)

    for _ in 1..<element {
        let select = Int(arc4random_uniform(2))

        let lastElement = step.last
        let newElement = haveHorizontalLadder(have: Int(select))

        step.append(verifyDuplication(first: lastElement!, second: newElement, select: select))
    }

    return step
}

// 이름에 공백 추가하는 함수
func addBlank(name:String) -> String{
    var result:String = ""
    switch name.count {
    case 1:
        result = "  " + name + "  "
    case 2:
        result = "  " + name + " "
    case 3:
        result = " " + name + " "
    case 4:
        result = name + " "
    default:
        result = name
    }
    return result
}

// 사다리 만드는 함수
func makeLadder(elements:LadderGame) -> [[LadderStep.Step]] {
    var ladders = [[LadderStep.Step]]()
    
    for _ in 0..<elements.height {
        ladders.append(makeStep(element: elements.names.count))
    }
    
    return ladders
}

// 사다리 유무 정하는 함수
func haveHorizontalLadder(have:Int) -> LadderStep.Step {
    // only : 0 or 1
    guard have == 0 else {
        return LadderStep.Step.have
    }
    return LadderStep.Step.none
}

main()
