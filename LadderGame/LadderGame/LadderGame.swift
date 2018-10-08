//
//  LadderGame.swift
//  LadderGame
//
//  Created by 윤동민 on 2018. 10. 1..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    private(set) var height : Int
    private var names : [LadderPlayer]
    private var ladder : [[LadderStep]]
    
    init(){
        self.height = 0
        self.names = []
        self.ladder = [[]]
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
    mutating func setLadder(height: Int){
        ladder = Array(repeating: Array(repeating: LadderStep(), count: names.count), count: height)
        for index in 0..<height{
            ladder[index] = addColummRandomLadder(rowLadder: ladder[index])
        }
    }
    
    // Index가 Zero일 경우와 아닐 경우를 구분 해서 실행
    func isIndexZero(index : Int, ladder : [LadderStep]) -> LadderStep{
        guard index == 0 else {
            return notIndexZero(index: index, ladder: ladder)
        }
        return createRandomLadder()
    }
    
    // Index가 Zero가 아닐 경우 실행 --> 사다리의 이전을 검사하여 "-"가 중복되는지 확인한 후 행동
    func notIndexZero(index : Int, ladder : [LadderStep]) -> LadderStep{
        guard ladder[2*index-1].isExistLadder() else{
            return createRandomLadder()
        }
        var spaceInLadder = LadderStep()
        spaceInLadder.setLadderOneStep(one: "     ")
        return spaceInLadder
    }
    
    // 사다리에 "-" 또는 " " 랜덤으로 생성
    func addColummRandomLadder(rowLadder: [LadderStep]) -> [LadderStep] {
        var rowLadder : [LadderStep] = rowLadder
        for index in 0..<rowLadder.count-1{
            rowLadder.insert(isIndexZero(index: index, ladder: rowLadder), at: 2*index+1)
        }
        return rowLadder
    }
    
    // isExistLadder() 결과에 따라 공백과 다리 생성
    func createRandomLadder() -> LadderStep{
        var returnvalue = LadderStep()
        guard spaceOrLadderCreate() else {
            returnvalue.setLadderOneStep(one: "     ")
            return returnvalue
        }
        returnvalue.setLadderOneStep(one: "-----")
        return returnvalue
    }
    
    // 랜덤 함수로 True False 리턴
    func spaceOrLadderCreate() -> Bool{
        return arc4random_uniform(2) == 0
    }
    
    // 사다리를 출력
    func printLadder(){
        for index in 0..<height{
            print("   ", terminator: "")
            for onestep in ladder[index]{
                print("\(onestep.ladderOneStep)", terminator: "")
            }
            print("")
        }
    }
    
    // 플레이어 이름 출력
    func printPlayersName(){
        for player in names{
            print(" \(player.playerName)", terminator: "")
            plusSpaceAfterName(nameCount: player.playerName.count)
        }
    }
    
    // 이름의 글자 수에 따라 공백 생성
    private func plusSpaceAfterName(nameCount: Int){
        for _ in 0..<5-nameCount {
            print(" ", terminator: "")
        }
    }
}
