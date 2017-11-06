//
//  InputView.swift
//  LadderGame
//
//  Created by Eunjin Kim on 2017. 10. 27..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {

    mutating func prompt() -> LadderGameInfo {
        var nameOfPlayer = ""
        var height = 0
        
        print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        if let nameOfPlayers = readLine() {
            nameOfPlayer = nameOfPlayers
        } else {
            print("사람 이름 입력 error")
        }
        print("최대 사다리 높이는 몇 개인가요?")
        if let heightForLadder = readLine() {
            height = Int(heightForLadder)!
        } else {
            print("사다리높이 입력 error")
        }
        return LadderGameInfo(nameOfPlayer: nameOfPlayer, height: height)

    }
    
    static func seperateNameOfPlayers(ladderGameInfo: LadderGameInfo) -> LadderGameInfo {
        let nameOfSeperate = ladderGameInfo.nameOfPlayer.split(separator: ",").map({String($0)}).map({LadderPlayer(name: $0)})
        let heightOfSeperate = ladderGameInfo.heightForLadder
        let newLadderGameInfo = LadderGameInfo(names: nameOfSeperate, height: heightOfSeperate)
        return newLadderGameInfo
    }
}
