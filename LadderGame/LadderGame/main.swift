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
func main() -> Bool {
    let participants = InputView().getParticipant()
    if !InputCheck().isValid(people: participants) {
        print("5자 이하의 이름을 입력해주세요.")
        return false
    }
    
    let height = InputView().getHeight()
    if !InputCheck().isValid(height: height) {
        print("3 이상의 높이를 입력해주세요.")
        return false
    }
    
    let dataSet = LadderGame(height: height, names: participants, leg: true).delieverDTO()
    
    ResultView(dataSet: dataSet).printOut()
    return true
}

while (true) {
    if !main() {break}
}
