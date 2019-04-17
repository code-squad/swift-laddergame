//
//  InputView.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 에러 타입
enum LadderInputErrors: Error {
    case lessNumber
    case toLongName
}

/// 입력할 수 있는 변수 이름들과 입력 안내 멘트
enum InputableVariableName: String {
    case players = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case maximumHeight = "최대 사다리 높이는 몇 개인가요?"
}

struct InputView {
    private(set) var players: [LadderPlayer] = [LadderPlayer]()
    private(set) var maximumHeight: Int = 0
    
    /// 입력받는 함수
    private func inputFromUser (_ variableName: InputableVariableName) -> (String) {
        print(variableName.rawValue)
        let valueEntered = readLine() ?? "0"
        return valueEntered
    }

    /// 사용자로부터 최대 사다리 높이를 입력받는 함수
    mutating func inputMaximumHeight () throws -> () {
        let valueEntered = inputFromUser(InputableVariableName.maximumHeight)
        guard let numberEnterd = Int(valueEntered), numberEnterd > 1 else {
            throw LadderInputErrors.lessNumber
        }
        maximumHeight = numberEnterd
    }

    /// 사용자로부터 이름을 입력받는 함수
    mutating func inputPlayerNames () throws -> () {
        let valueEntered = inputFromUser(InputableVariableName.players)
        let names = valueEntered.split(separator: ",")
        if names.count < 2 { throw LadderInputErrors.lessNumber }
        for name in names {
            do {
                players.append(try LadderPlayer(playerName: String(name)))
            }
            catch {
                players.removeAll()
                throw LadderInputErrors.toLongName
            }
        }
    }
}
