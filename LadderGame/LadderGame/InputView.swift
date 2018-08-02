//
//  InputView.swift
//  LadderGame
//
//  Created by KIMMINSIK on 2018. 7. 29..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

//참여할 사람 입력 받기 -> InputView
struct InputView {
    func inputUserData () -> Array<String>? {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let inputUserName = readLine()
        guard let inputPlayer = inputUserName else { return nil }
        let player = inputPlayer.components(separatedBy: ",")
        return player
    }
   
//사다리 높이 정하기 -> InputView
    func inputLadderLength () -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let inputMaxLadderNumber = Int(readLine()!)
        guard let maxLadderNumber = inputMaxLadderNumber else { return 0 }
        return maxLadderNumber
    }
}
