//
//  InputView.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 5..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputView {
    
    // 참여할 플레이어 이름을 입력받음
    func inputJoinPlayersName() -> String{
        print("참여할 사람 이름을 입력하세요.")
        guard let players = readLine() else{
            return "Error"
        }
        return players
    }
    
    // 사다리의 최대 높이를 입력받음
    func inputLadderOfHeight() -> Int{
        print("최대 사다리의 높이를 입력하세요.")
        guard let ladderHeight = readLine() else {
            return -1
        }
        return Int(ladderHeight) ?? -1
    }
    
    // 초기 사다리 생성
    func setLadder(height: Int, playerCount: Int) -> [[LadderStep]]{
        var ladder : [[LadderStep]] = Array(repeating: Array(repeating: LadderStep(), count: playerCount), count: height)
        for index in 0..<height{
            ladder[index] = addColummRandomLadder(rowLadder: ladder[index])
        }
        return ladder
    }
    
    // 사다리에 "-" 또는 " " 랜덤으로 생성
    private func addColummRandomLadder(rowLadder: [LadderStep]) -> [LadderStep] {
        var rowLadder : [LadderStep] = rowLadder
        for index in 0..<rowLadder.count-1{
            rowLadder.insert(isIndexZero(index: index, ladder: rowLadder), at: 2*index+1)
        }
        return rowLadder
    }
    
    // Index가 Zero일 경우와 아닐 경우를 구분 해서 실행
    private func isIndexZero(index : Int, ladder : [LadderStep]) -> LadderStep{
        guard index == 0 else {
            return notIndexZero(index: index, ladder: ladder)
        }
        return createRandomLadder()
    }
    
    // Index가 Zero가 아닐 경우 실행 --> 사다리의 이전을 검사하여 "-"가 중복되는지 확인한 후 행동
    private func notIndexZero(index : Int, ladder : [LadderStep]) -> LadderStep{
        guard ladder[2*index-1].isExistLadder() else{
            return createRandomLadder()
        }
        var spaceInLadder = LadderStep()
        spaceInLadder.setLadderOneStep(one: "     ")
        return spaceInLadder
    }
    
    // isExistLadder() 결과에 따라 공백과 다리 생성
    private func createRandomLadder() -> LadderStep{
        var returnvalue = LadderStep()
        guard spaceOrLadderCreate() else {
            returnvalue.setLadderOneStep(one: "     ")
            return returnvalue
        }
        returnvalue.setLadderOneStep(one: "-----")
        return returnvalue
    }
    
    // 랜덤 함수로 True False 리턴
    private func spaceOrLadderCreate() -> Bool{
        return arc4random_uniform(2) == 0
    }
}
