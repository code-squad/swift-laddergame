//
//  LadderGame.swift
//  LadderGame
//
//  Created by jack on 2017. 12. 4..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//
// 사다리 높이 속성과 참여자를 Array로 포함하는 구조체

import Foundation

struct LadderGame {
    
    private var height = 0
    private var names : [LadderPlayer]
    
    init(namesVal : [String], heightVal : Int) {
        var playerNames = [LadderPlayer]()
        for oneName in namesVal  {
            let playerName = LadderPlayer(name: oneName)
            playerNames.append(playerName)
        }
        self.names = playerNames
        self.height = heightVal
    }
    
    //출력할 사다리를 위한 2차원 배열을 생성하는 함수
    //입력 : 참가자수, 사다리 높이의 갯수
    //return : 2차원 구조의 사다리 배열
    func generateSetOfLadder (entryVal : Int, heightVal : Int) -> [[String]] {
        let setOfLadder : [[String]] = Array(repeatElement(Array(repeatElement("", count: entryVal - 1)), count: heightVal))
        return setOfLadder
    }
    //"-"를 그릴지 그리지 않을지 결정하는 함수
    //return : true 또는 false
    func makeRandomHorizontalLine () -> Bool {
        let RandomNum : UInt32 = arc4random_uniform(2)
        guard RandomNum == 0 else { return false }
        return true
    }
    //하나의 가로줄을 그리거나, 그리지 않는 함수
    //입력 : 랜덤값(Bool)
    //return : 입력이 True면 "-", false면 " "
    func drawOneHorizontalLine (_ randomVal : Bool) -> String {
        let drawLineVal = makeRandomHorizontalLine()
        guard randomVal == false || drawLineVal == false else { return "-" }
        return " "
    }
    //사다리 한층별로 가로줄들을 그리는 함수
    //입력 : 한층에 해당되는 1차원 사다리 배열
    //출력 : 가로줄이 그려진 1차원 사다리 배열
    func drawHorizontalLines (oneFloorOfLadder : [String]) -> [String]{
        var temp = oneFloorOfLadder
        for index in 0..<temp.count {
            guard index == 0 || temp[index - 1] != "-" else { //이전 인덱스에 "-"가 있을경우 : " "을 넣는다.
                temp[index] = drawOneHorizontalLine(false)
                continue
            }
            temp[index] = drawOneHorizontalLine(true)
        }
        return temp
    }
    //랜덤으로 결정된 가로줄을 그리는 함수
    //입력 : 2차원 배열
    //출력 : 가로줄을 입력한 2차원 사다리 배열
    func drawLadderWithHorizontalLines (ladderSet : [[String]]) -> [[String]] {
        var ladderWithHorizontalLine = ladderSet
        for indexOfHeight in 0..<ladderWithHorizontalLine.count {
            ladderWithHorizontalLine[indexOfHeight] = drawHorizontalLines(oneFloorOfLadder: ladderWithHorizontalLine[indexOfHeight])
        }
        return ladderWithHorizontalLine
    }
}
