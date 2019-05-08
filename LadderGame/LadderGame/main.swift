//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

/// 게임을 실행 합니다.
/// - throws:
///     - InputError.isEmpty: 문자열이 비어있음
///     - InputError.notANumber: 정수형 변환이 불가능
///     - InputError.invalidNumber: 유효하지 않은 정수 범위
func playGame() throws {
    do {
        let inputView = InputView()
        let names = try inputView.readPlayerNames(question: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let ladderHeight = try inputView.readNumber(question: "최대 사다리 높이는 몇 개인가요?")
        if let ladderGame = LadderGame(names: names, height: ladderHeight) {
            let resultView = ResultView()
            resultView.draw(ladderGame)
        }
    } catch let error as InputView.Error {
        print(error.localizedDescription)
    }
}

try playGame()
