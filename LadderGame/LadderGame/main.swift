//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// Swift-LadderGame

// 추상화된 사다리 정보를 출력을 위해 변환
func legToVisible(imaginary: Bool) -> String {
    let leg = "-----", noLeg = "     "
    
    if imaginary == true {
        return leg
    }
    
    return noLeg
}

// 사다리 중 한 계단을 출력하는 함수
func printOneStepUsing(_ leg: [Bool]) {
    var visibleLeg = String()
    let edge = "|"
    
    for i in leg {
        visibleLeg += legToVisible(imaginary: i) + edge
    }
    
    print("\(edge)\(visibleLeg)")
}

// 사다리를 출력하는 함수
func printOut(_ ladder: [[Bool]]) {
    for step in ladder {
        printOneStepUsing(step)
    }
}
// 메인 함수
func main() {
    var inputValue = InputValue()
    inputValue.getParticipant()
    inputValue.getHeight()
    
    let elements = inputValue.players
    let people = elements.names
    let height = elements.height
    
    let ladderStep = LadderStep()
    
    
    if people.count > 1 && height > 1 {
        let ladder = ladderStep.buildLadderWith((people.count, height))
        printOut(ladder)
    }
    
    print("2이상의 숫자를 입력해주세요.")
}

main()
