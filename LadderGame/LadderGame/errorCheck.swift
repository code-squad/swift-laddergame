//
//  errorCheck.swift
//  LadderGame
//
//  Created by JH on 27/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation


enum UserInputError: Error {
    case overNameCount
    case incorrectPlayerData
    case incorrectLadderData
}

func checkPlayerError(chNames: Array<String>) throws {
    guard chNames.count != 1 else {
        print("플레이어를 두사람이상 입력해주세요")
        print("오류가 발생했으니 게임을 다시 실행해주세요")
        throw UserInputError.incorrectPlayerData
    }
    var largeNameCount = 0
    for index in 0..<chNames.count {
        if largeNameCount < chNames[index].count {
            largeNameCount = chNames[index].count
            guard largeNameCount < 6 else {
                print("플레이어이름은 5글자까지 가능합니다")
                print("오류가 발생했으니 게임을 다시 실행해주세요")
                throw UserInputError.overNameCount
            }
        }
    }
}

func checkLabberError(chladderNum: Int) throws {
    guard chladderNum != 0 else {
        print("사다리의 높이는 1층 이상으로 입력해주세요")
        print("오류가 발생했으니 게임을 다시 실행해주세요")
        throw UserInputError.incorrectLadderData
    }
}
