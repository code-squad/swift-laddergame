//
//  InputValue.swift
//  test2
//
//  Created by Mrlee on 2017. 10. 26..
//  Copyright © 2017년 Mrlee. All rights reserved.
//

import Foundation

struct InputView {
    func read() -> GameInfo{
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let peopleNames = readLine()
        print("최대 사다리 높이는 몇 개인가요?")
        let ladderNumber = readLine()
        let playerInputInfo = confirm(player: peopleNames, row: ladderNumber)
        guard let names = playerInputInfo.player, playerInputInfo.row != 0 else {
            let errorInfo = GameInfo()
            return errorInfo
        }
        
        let ladderInfo = GameInfo(player: names, row: playerInputInfo.row)
        return ladderInfo
    }
    
    private func confirm(player: String?, row: String?) -> (player: String?, row: Int){
        guard let playerNames = player, let ladderRow = Int(row!) else {
            print("입력 오류입니다.")
            return (nil, 0)
        }
        return (playerNames, ladderRow)
    }
}
