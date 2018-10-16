//
//  LadderGame.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private var height : Int
    private var names : [LadderPlayer]
    private var ladder : [[LadderStep]]
    
    init(){
        self.height = 0
        self.names = []
        self.ladder = [[]]
    }
    
    // DTO 구조체 리턴
    func getLadderGameDTO() -> LadderGameDTO{
        return LadderGameDTO(height: self.height, names: self.names, ladder: self.ladder)
    }
    
    // 플레이어 이름 설정
    mutating func setPlayersName(playerNames : [LadderPlayer]){
        self.names = playerNames
    }
    
    // 사다리 높이 설정
    mutating func setLadderHeight(ladderHeight: Int){
        self.height = ladderHeight
    }
    
    // 초기 사다리 생성
    mutating func makeLadder(){
        ladder = Array(repeating: Array(repeating: LadderStep(), count: self.names.count-1), count: self.height)
        for index in 0..<self.height{
            ladder[index] = addColummRandomLadder(rowLadder: ladder[index])
        }
    }
    
    // 사다리에 "-" 또는 " " 랜덤으로 생성
    private func addColummRandomLadder(rowLadder: [LadderStep]) -> [LadderStep] {
        var rowLadder : [LadderStep] = rowLadder
        for index in 0..<rowLadder.count{
            rowLadder[index] = isIndexZero(element: rowLadder, index: index)
        }
        return rowLadder
    }
    
    // Index가 Zero 일 경우와 아닐 경우를 나뉘어서 실행
    private func isIndexZero(element: [LadderStep], index: Int) -> LadderStep{
        var rowLadder : [LadderStep] = element
        if index == 0 {
            rowLadder[index].setLadderOneStep(one: spaceOrLadderCreate())
            return rowLadder[index]
        }
        else {
            rowLadder[index].setLadderOneStep(one: notIndexZero(element: rowLadder, index: index))
            return rowLadder[index]
        }
    }
    
    // Index가 Zero가 아닌 경우 앞 LadderStep 검사하여 true, false 반환
    private func notIndexZero(element: [LadderStep], index: Int) -> Bool{
        var rowLadder: [LadderStep] = element
        if rowLadder[index-1].isExistLadder() {
            return false
        }
        else{
            return spaceOrLadderCreate()
        }
    }
    
    // 랜덤 함수로 True False 리턴
    private func spaceOrLadderCreate() -> Bool{
        return arc4random_uniform(2) == 0
    }
}
