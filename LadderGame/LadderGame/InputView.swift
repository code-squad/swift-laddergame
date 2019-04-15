//
//  InputView.swift
//  LadderGame
//
//  Created by joon-ho kil on 4/12/19.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

/// 에러 타입
enum LadderGameErrors: Error {
    case lessNumber
    case toLongName
}

/// 입력할 수 있는 변수 이름들과 입력 안내 멘트
enum InputableVariableName: String {
    case players = "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)"
    case maximumHeight = "최대 사다리 높이는 몇 개인가요?"
}

struct InputView {
    var players = [LadderPlayer]()
    var maximumHeight = 0
    
    /// 입력받는 함수 메인
    mutating func input () -> ([LadderPlayer], Int) {
        while true {
            do {
                players = try inputFromUserToPlayerNames(InputableVariableName.players)
                maximumHeight = try inputFromUserToMaximumHeight(InputableVariableName.maximumHeight)
                break
            } catch LadderGameErrors.lessNumber {
                print("참여할 사람과 최대 사다리 높이는 최소 2 이상이어야 합니다.")
            } catch LadderGameErrors.toLongName {
                print("사람의 이름은 최대 영문 5자입니다.")
            } catch {
                print("알 수 없는 오류입니다")
            }
        }
        
        return (players, maximumHeight)
    }

    /// 사용자로부터 최대 사다리 높이를 입력받는 함수
    private func inputFromUserToMaximumHeight (_ variableName: InputableVariableName) throws -> (Int) {
        print(variableName.rawValue)
        guard let numberEnterd = Int(readLine() ?? "0"), numberEnterd > 1 else {
            throw LadderGameErrors.lessNumber
        }
        return numberEnterd
    }

    /// 사용자로부터 이름을 입력받는 함수
    private func inputFromUserToPlayerNames (_ variableName: InputableVariableName) throws -> [LadderPlayer] {
        var playerArray = [LadderPlayer]()
        print(variableName.rawValue)
        let namesEnterd = readLine() ?? "0"
        let names = namesEnterd.split(separator: ",")
        if names.count < 2 { throw LadderGameErrors.lessNumber }
        for name in names {
            if name.count > 5 { throw LadderGameErrors.toLongName }
            playerArray.append(LadderPlayer(playerName: String(name)))
        }
        return playerArray
    }
}
