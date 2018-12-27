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
    static func receiveLadder() -> String {
        print("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ", terminator: "")
        let input = readLine() ?? " "
        return input
    }
    //receive input how many people are.
    static func receivePeople() -> String {
        print("참여하는 사람은 몇명인가요? ex) 3:\n>>>", terminator: "")
        let input = readLine() ?? " "
        return input
    }
}
