//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func main() {
    let participantInputView = InputView(question: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
    let ladderHeightInputView = InputView(question: "최대 사다리 높이는 몇 개인가요?")

    let ladderGame = LadderGame(height: Int(ladderHeightInputView.inputValue())!, names: participantInputView.inputValue())
    
    print(ladderGame)
}

main()
