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
    let participants = InputView().getParticipant(ment: "참여할 사람 이름을 입력해주세요.\n(예: JK,Crong,Honux,Pobi)")
    if !InputCheck().isValid(people: participants) {
        print("3명 이상, 5자 이하의 이름을 입력해주세요.")
        return false
    }
    
    let height = InputView().getHeight(ment: "최대 사다리 높이는 몇 개인가요?")
    if !InputCheck().isValid(height: height) {
        print("3 이상, 20 이하의 높이를 입력해주세요.")
        return false
    }
    
    let dataSet = LadderGame(height: height, names: participants)?.delieverDTO()
    
    ResultView(dataSet: dataSet!).printOut()
    return true
}

while (true) {
    if !main() {break}
}
