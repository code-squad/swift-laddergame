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
    
    // 플레이어 이름의 배열을 받아온 후 ","를 기준으로 나누어서 names 배열에 넣음
    mutating func setPlayersName(userInput : String){
        let playerNames = userInput.split(separator: ",")
        for player in playerNames{
            checkPlayerName(receiveName: String(player))
        }
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
    
    // 사용자의 사다리 높이 입력 값을 검사
    func isRightUserInput(input: Int) -> Bool{
        guard input != -1 else {
            return false
        }
        return true
    }
    
    // 입력받은 플레이어 이름이 5글자 이상인 경우 배열에 넣지 않음
    mutating func checkPlayerName(receiveName: String) {
        if receiveName.count > 5 { return }
        self.names.append(LadderPlayer(name: receiveName))
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
