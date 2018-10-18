//
//  InputView.swift
//  LadderGame
//
//  Created by Jun ho Lee on 2018. 10. 3..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    //이름(쉼표로 구분, 최대 5글자) 받아 문자열덩어리 출력
    func getNames() -> Array<String> {
        print("참가자 이름을 쉼표로 구분하여 입력해주세요.")
        let playerNames = readLine() ?? ""
        return separateNames(playerNames: playerNames)
    }
    
    //이름을 분리해서 배열 출력
    private func separateNames(playerNames: String) -> Array<String> {
        return playerNames.components(separatedBy: ",")
    }
    
    //String 이름 배열을 LadderPlayer로 저장
    func getPlayers(stringNames: Array<String>) -> [LadderPlayer] {
        var players = Array<LadderPlayer>()
        for stringName in stringNames {
            players.append(LadderPlayer(name: stringName))
        }
        return players
    }
    
    //높이를 받아 문자로 출력
    func getHeight() -> Int {
        print("사다리 최대 높이를 입력해주세요.")
        let ladderHeight = readLine() ?? "0"
        return makeNumericHeight(stringHeight: ladderHeight)
    }
    
    //높이를 숫자로 출력
    private func makeNumericHeight(stringHeight: String) -> Int {
        if let numericHeight = Int(stringHeight) {
            return numericHeight
        }
        return -1
    }
    
    //player 문자열 길이 확인
    private func checkNameLength(player: LadderPlayer) -> Bool{
        return player.name.count < 1 || player.name.count > 5
    }
    
}
