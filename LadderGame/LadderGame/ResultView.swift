//
//  ResultView.swift
//  LadderGame
//
//  Created by BLU on 2019. 4. 25..
//  Copyright © 2019년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    
    /// 게임 결과를 출력합니다.
    ///
    /// - Parameter ladderGame: 사다리 게임 구조체
    func draw(_ ladderGame: LadderGame) {
        printLadder(ladderGame.start())
        printNames(ladderGame.players)
    }
    
    /// 게임 참가자들의 이름을 가져옵니다.
    ///
    /// - Parameter players: 사다리 게임 참가자들
    /// - Returns: 게임 참가자들의 이름 문자열
    private func printNames(_ players: [LadderPlayer]) {
        let names = players.map { $0.name.padding(toLength: 6, withPad: " ", startingAt: 0) }.joined()
        print(names, terminator: "")
    }
    
    /// 사다리를 나타내는 문자열을 가져옵니다.
    ///
    /// - Parameter layers: bool 타입 배열을 갖는 2차원 배열
    /// - Returns: 사다리를 나타내는 문자열
    private func printLadder(_ layers: [[Bool]]) {
        let ladder = layers.map { layer($0) }.joined(separator: "\n")
        print(ladder)
    }
    
    /// 사다리 층을 나타내는 문자열을 가져옵니다.
    ///
    /// - Parameter steps: bool 타입 배열
    /// - Returns: 사다리 층을 나타내는 문자열
    private func layer(_ steps: [Bool]) -> String {
        let rung = "|"
        let joined = steps.map { LadderStep($0).type.rawValue.description }.joined(separator: rung)
        let layer = "\(rung)\(joined)\(rung)"
        
        return layer
    }
}
