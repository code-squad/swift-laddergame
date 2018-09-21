//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let participant = InputView(question: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)").inputValue()
    guard ValidityCheck().isValid(names: participant) else {return}
    let ladderHeight = Int(InputView(question: "최대 사다리 높이는 몇 개인가요?").inputValue()) ?? 0
    guard ValidityCheck().isValid(height: ladderHeight) else {return}
    
    let ladderGame = LadderGame(height: ladderHeight, names: participant)

    print(ladderGame)
}



main()
