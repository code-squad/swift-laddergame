//
//  inputView.swift
//  LadderGame
//
//  Created by 김장수 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// InputValue 객체는 사다리 게임을 하는데 필요한 요소를 입력받는 메소드를 보유

struct InputValue {
    // 참가할 사람들의 명단을 입력받는 함수
    func getParticipant() -> String {
        print("참여할 사람 이름을 입력해주세요.")
        let participants = readLine()
        return isValid(names: participants)
    }
    
    // 사다리 높이를 입력받는 함수
    func getHeight() -> Int {
        print("최대 사다리 높이는 몇 개인가요?")
        let height = readLine()
        return isValid(steps: height)
    }
    
    // --------------------내부에서만 호출하는 메소드---------------------
    
    // 입력받는 참가자 명단을 옵셔널 체크하는 함수
    private func isValid(names: String?) -> String {
        guard let value = names else {return ""}
        return value
    }
    
    // 입력받은 높이를 옵셔널 체크하는 함수
    private func isValid(steps: String?) -> Int {
        guard let value = steps else {return 0}
        return Int(value)!
    }
}

