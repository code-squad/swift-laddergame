//
//  view.swift
//  LadderGame
//
//  Created by yuaming on 2017. 10. 26..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct Input {
    static func askInputValue() -> (askResult: Bool, userNames: String, ladderHeight: String) {
        guard let inputUserNames = readValue("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)", "\n") else {
            return (false, "", "")
        }
        
        guard let inputLadderHeight = readValue("최대 사다리 높이는 몇 개인가요?", "\n") else {
            return (false, "", "")
        }
        
        return (true, inputUserNames, inputLadderHeight)
    }
    
    private static func readValue(_ question: String, _ terminator: String) -> String? {
        print(question, terminator: terminator)
        guard let value = readLine() else {
            return nil
        }
        
        return value
    }
}
