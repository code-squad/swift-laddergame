//
//  InputView.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    //프로퍼티 선언
    let players = getPlayers()
    let height = getHeight()
    
    //이름(쉼표로 구분, 최대 5글자) 받아 문자열덩어리 출력
    static func getNames() -> Array<String> {
        print("참가자 이름을 쉼표로 구분하여 입력해주세요.")
        let playerNames = readLine() ?? ""
        return separateNames(playerNames: playerNames)
    }
    
    //이름을 분리해서 배열 출력
    static func separateNames(playerNames: String) -> Array<String> {
        return playerNames.components(separatedBy: ",")
    }
    
    //String 이름 배열을 LadderPlayer로 저장
    static func getPlayers() -> [LadderPlayer] {
        let stringNames = getNames()
        var players = Array<LadderPlayer>()
        for stringName in stringNames {
            players.append(LadderPlayer(name: stringName))
        }
        print(players.count)
        return players
    }
    
    //높이를 받아 문자로 출력
    static func getHeight() -> Int {
        print("사다리 최대 높이를 입력해주세요.")
        let ladderHeight = readLine() ?? "0"
        return makeNumericHeight(stringHeight: ladderHeight)
    }
    
    //높이를 숫자로 출력
    static func makeNumericHeight(stringHeight: String) -> Int {
        if let numericHeight = Int(stringHeight) {
            return numericHeight
        }
        return 0
    }
}
