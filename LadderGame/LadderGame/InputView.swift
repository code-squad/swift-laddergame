//
//  InputValue.swift
//  test2
//
//  Created by Mrlee on 2017. 10. 26..
//  Copyright © 2017년 Mrlee. All rights reserved.
//

import Foundation
typealias LadderGameInfo = (players: String?, column: Int, row: Int)

struct InputView {
    private func confirm(names: String?, ladderNumber ladderRow: String?) -> LadderGameInfo {
        guard let playerNames = names, let ladderRow = Int(ladderRow!) else {
            print("입력 오류입니다.")
            return (nil, 0, 0)
        }
        let names = playerNames.split(separator: ",")
        return (playerNames, names.count, ladderRow)
    }
    
    func read() -> LadderGameInfo {
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let peopleNames = readLine()
        print("최대 사다리 높이는 몇 개인가요?")
        let ladderNumber = readLine()
        let gameInfo =  confirm(names: peopleNames, ladderNumber: ladderNumber)
        return (gameInfo.players, gameInfo.column, gameInfo.row)
    }
}
