//
//  inputView.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    // receive input how many ladders are.
    private static func deliver(_ message: String) -> String {
        print(message, terminator: "")
        return readLine() ?? ""
    }
    // receive input how many ladders are
    static func receiveLadder() -> String {
        let input = deliver("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ")
        return input
    }
    // receive input how many people are.
    static func receiveName() -> String {
        let input = deliver("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요) ")
        return input
    }
}

