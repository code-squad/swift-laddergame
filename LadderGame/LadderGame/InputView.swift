//
//  InputView.swift
//  LadderGame
//
//  Created by jang gukjin on 12/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum CountQuestions : String, CaseIterable{
    case people = "참여할 사람을 입력하세요 (구분은 ,로 하고 최대 5명까지 입력가능홥니다)"
    case ladder = "최대 사다리 높이는 몇 개인가요?"
}

/// 사용자의 입력을 받는 구조체
struct InputView {
    /// 사람과 사다리의 수를 입력받는 함수
    func inputCount(askText : CountQuestions)->String? {
        print(askText.rawValue)
        let inputText = readLine()
        
        return inputText
    }

    /// 사람과 사다리의 수를 입력받는 함수
    func inputName() throws -> [LadderPlayer] {
        var names = [LadderPlayer]()
        let askText = CountQuestions.people
        let nameText = inputCount(askText: askText)
        if nameText == nil { throw ErrorMessages.wrongInput}
        else {
            let invertStringNames = String(nameText!)
            let devideStringNames = invertStringNames.split(separator: ",")
            for name in devideStringNames{
                if String(name).count>5 { throw ErrorMessages.wrongInput}
                names.append(LadderPlayer(player: String(name)))
            }
            if names.count > 5 || names.count < 2{
                throw ErrorMessages.outOfRange
            }
            return names
        }
    }
    
    func inputHeight() throws -> Int {
        let askText = CountQuestions.ladder
        let heightText = inputCount(askText: askText)
        guard let height = Int(heightText ?? "0"), height > 1 else{
            throw ErrorMessages.outOfRange
        }
        return height
    }
}
