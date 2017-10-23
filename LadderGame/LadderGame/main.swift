//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 플레이어 이름이 5자 넘는지 확인.
func confirmBeingPlayer(_ player: String)->LadderPlayer?{
    // 새 플레이어 생성.
    let newPlayer = LadderPlayer(name: player)
    // 5자 초과하지 않으면 새 플레이어 인스턴스 반환.
    guard newPlayer.isNameOverMaxCount else { return newPlayer }
    // 5자를 초과하면 nil 반환.
    return nil
}

// 게임 셋팅.
func readyLadder(of ladderHeight: Int, for playerNames: [String])->LadderGame?{
    var ladderPlayers: [LadderPlayer] = []
    for ofPlayer in playerNames{
        guard let newPlayer = confirmBeingPlayer(ofPlayer) else{ break }
        ladderPlayers.append(newPlayer)
    }
    return LadderGame(heights: ladderHeight, names: ladderPlayers)
}

// 입력받은 문장을 게임에 사용할 이름들로 전처리.
func splitNames(of inputNames: String, with sep: Character)->[String]{
    // 쉼표 기준 배열로 분리.
    let splitNames = inputNames.split(separator: sep)
    return splitNames.map { $0.trimmingCharacters(in: .whitespaces) }
    //return checkAllNames(of: splitNames)
}

while(true){
    print("참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요):", terminator: " ")
    guard let participants = readLine() else{ break }
    let players = splitNames(of: participants, with: ",")
    
    print("최대 사다리 높이는 몇 개인가요?", terminator: " ")
    guard let ladderHeightInString = readLine(), let height = Int(ladderHeightInString) else{ break }
    
    // 사용자 입력값으로 사다리 출력 함수 호출.
    guard let game = readyLadder(of: height, for: players) else{ break }
    game.drawLadder()
}

