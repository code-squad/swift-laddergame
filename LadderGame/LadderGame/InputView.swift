//
//  inputView.swift
//  LadderGame
//
//  Created by cushy k on 27/12/2018.
//  Copyright © 2018 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    /**
     receive input how many ladders are.
    
     - parameters:
         - message: message for printing.
     
     - returns:
     A string of input message. If not String, return empty string.
    */
    private static func deliver(_ message: String) -> String {
        print(message, terminator: "")
        return readLine() ?? ""
    }

    /**
     receive input how many ladders are
     
     - returns:
     A String of number of ladders.
    */
    static func receiveLadder() -> String {
        let input = deliver("최대 사다리의 높이는 몇개인가요? ex) 5:\n>>> ")
        return input
    }
    
    /**
     receive input how many people are.
     
     - returns:
     A String of number of people.
         ```
         nori, hngfu, jamie, billy
         ```
     */
    //NOTE: return: LadderPlayer(name: input), return type: LadderPlayer
    static func receiveName() -> [LadderPlayer] {
        let input = deliver("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요) ")
        let names = LadderGame.extract(from: input)
        return names.map{ LadderPlayer(name: $0) }
    }
}
