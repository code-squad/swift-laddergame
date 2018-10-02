//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// Swift-LadderGame

// 메인 함수
func main() {
    // 입력 구조체의 인스턴스를 만들어서 사다리 게임에 필요한 요소 생성
    var inputValue = InputValue()
    inputValue.getParticipant()
    inputValue.getHeight()
    
    let elements = inputValue.ladderGame
    let people = elements.names
    let high = elements.height
    
    
    // 사다리를 만드는 구조체의 인스턴스를 만듦
    let game = LadderGame(height: high, names: people)
    
    
    // 출력 구조체의 인스턴스
    let resultValue = ResultValue()
    
    if people.count > 1 && high > 1 {
        // 사다리 생성
        let ladder = game.buildLadderWith((people.count, high))
        // 사다리 출력
        resultValue.printOut(ladder, game.names)
    }
    
    print("2이상의 숫자를 입력해주세요.")
}

main()
