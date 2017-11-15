//
//  LadderGame.swift
//  ladderGameStep3
//
//  Created by Choi Jeong Hoon on 2017. 11. 6..
//  Copyright © 2017년 JH Factory. All rights reserved.
//
import Foundation

// 사다리 속성과 참가자 정보를 갖는 구조체
struct LadderGame {
    private (set) var participant = [LadderPlayer]()
    // height에도 private뒤에 (set)을 붙혀서 읽는 것은 internal하게 변경
    private (set) var height = 0
    
    // 참가자 이름과 사다리 높이를 초기화메서드를 통해 초기값 삽입
    init (inputValues: ([String], Int)) {
        for player in inputValues.0 {
            let player = LadderPlayer(name: player)
            participant.append(player)
        }
        self.height = inputValues.1
    }
    
    // 1. 랜덤 불값 생성
      private func makeRandomBooleanValue () -> Bool {
        let randomNum = Int(arc4random_uniform(2))
        guard randomNum % 2 == 0 else { return false }
        return true
    }
    
    // 2. 랜덤 불값의 한줄 배열 만들기
      private func makeRandomInnerArray (_ countOfPlayers: Int) -> Array<Bool> {
        var firstArray = Array<Bool>()
        firstArray.insert(makeRandomBooleanValue(), at: 0)
        for index in 1 ..< countOfPlayers-1{
            if firstArray[index-1] == true {
                firstArray.append(false)
            } else {
                firstArray.append(makeRandomBooleanValue())
            }
        }
        return firstArray
    }
    
    // 3. 랜덤 불값의 2차원 배열 만들기
    func makeTwoDimentionalArray (_ countOfPlayers: Int, _ height: Int) -> Array<Array<Bool>> {
        var twoDimenArray = Array<Array<Bool>>()
        for _ in 0 ..< height {
            twoDimenArray.append(makeRandomInnerArray(countOfPlayers))
        }
        return twoDimenArray
    }
}
