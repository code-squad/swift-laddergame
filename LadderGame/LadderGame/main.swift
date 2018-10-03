//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// Swift-LadderGame

// 입력함수
func getElements(_ ladderGame: LadderGame, _ inputValue: InputValue) -> ([LadderPlayer], Int) {
    var ladder = ladderGame
    
    // 입력 구조체의 인스턴스를 만들어서 사다리 게임에 필요한 요소 생성
    
    ladder.names = inputValue.getParticipant()
    ladder.height = inputValue.getHeight()
    
    return (ladder.names, ladder.height)
}

// 사다리 구조 생성
func makeFrame(_ elements: ([LadderPlayer], Int), _ ladderGame: LadderGame, _ ladderStep: LadderStep) -> [[Bool]] {
    let players = elements.0, high = elements.1
    let ladder = ladderGame.buildLadderWith((players.count, high), ladderStep.legs)
    
    return ladder
}

// 출력함수
func printResult(_ elements: ([LadderPlayer], Int), _ resultValue: ResultValue, _ ladder: [[Bool]]) {
    let players = elements.0
    resultValue.printOut(ladder, players)
}



// 메인 함수
func main() {
    // --------------- 인스턴스를 생성하는 부분 ---------------
    
    // 입력 구조체의 인스턴스
    let inputValue = InputValue()
    
    // 출력 구조체의 인스턴스
    let resultValue = ResultValue()
    
    // players라는 LadderGame 인스턴스 생성
    let ladderGame = LadderGame(height: 0, names: [])
    
    // ladderStep이라는 LadderStep의 인스턴스 생성
    // 사다리 다리가 있고 없음을 표현하기 위해 초기화
    let ladderStep = LadderStep(legs: [true, false])
    
    
    // ------------- 입력, 사다리 구조 생성, 출력 ------------
    
    // 입력
    let elements = getElements(ladderGame, inputValue)
    
    // 사다리 구조 생성
    let ladder = makeFrame(elements, ladderGame, ladderStep)
    
    // 출력
    printResult(elements, resultValue, ladder)
}

main()
