//
//  InputView.swift
//  LadderGame
//
//  Created by 심 승민 on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView{
    let players: [String]
    let height: Int
    
    // 인스턴스 생성 시 사용자 입력 문자열을 전처리하여 저장.
    init(participants: String, with ladderHeight: String){
        self.players = InputView.splitNames(of: participants, with: ",")
        self.height = Int(ladderHeight) ?? 0
    }
    
    // 게임 셋팅.
    func readyLadder()->LadderGame?{
        var ladderPlayers: [LadderPlayer] = []
        for ofPlayer in self.players{
            // 이름 5자 넘지 않는 플레이어만 배열에 붙임. nil인 경우 패스하고 다음 플레이어 확인. --> break를 쓰면 안된다!
            guard let newPlayer = confirmBeingPlayer(ofPlayer) else{ continue }
            ladderPlayers.append(newPlayer)
        }
        return LadderGame(heights: self.height, names: ladderPlayers)
    }
    
    // 플레이어 이름이 5자 넘는지 확인.
    private func confirmBeingPlayer(_ player: String)->LadderPlayer?{
        // 새 플레이어 생성.
        let newPlayer = LadderPlayer(name: player)
        // 5자 초과하지 않으면 새 플레이어 인스턴스 반환.
        guard newPlayer.isNameOverMaxCount else { return newPlayer }
        // 5자를 초과하면 nil 반환.
        return nil
    }
    
    // 입력받은 문장을 게임에 사용할 이름들로 전처리.
    private static func splitNames(of inputNames: String, with sep: Character)->[String]{
        // 쉼표 기준 배열로 분리.
        let splitNames = inputNames.split(separator: sep)
        return splitNames.map { $0.trimmingCharacters(in: .whitespaces) }
    }
}
