//
//  main.swift
//  LadderGame
//
//  Created by Jack.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
//2차원 배열 안에 세로줄을 넣는 함수
//입력 : 참여할 학생 수, 사다리 높이 갯수
//출력 : 세로줄이 그려진 2차원 배열([[],[],[]...(2 * 참여할 학생수 - 1)까지])
func drawVerticalLine (entryVal : Int, heightVal : Int) -> [[String]]{
    var ladderWithVerticalLine : [[String]] = Array(repeatElement(Array(repeatElement("", count: (2 * entryVal - 1))), count: heightVal))
    for indexOfHeight in 0...(heightVal - 1) {
        for indexOfBlock in 0...(2 * entryVal - 1) {
            if indexOfBlock % 2 == 0 { //블록의 인덱스 주소가 짝수일 때 세로줄을 삽입
                ladderWithVerticalLine[indexOfHeight][indexOfBlock] = "|"
                continue
            }
        }
    }
    return ladderWithVerticalLine
}
//"-"를 그릴지 그리지 않을지 결정하는 함수
//출력 : true 또는 false
func makeRandomHorizontalLine () -> Bool {
    let RandomNum : UInt32 = arc4random_uniform(2)
    if RandomNum == 0 {
        return true
    }
    return false
}
//랜덤으로 결정된 가로줄을 넣는 함수
//입력 : 세로줄이 입력된 사다리 배열
//출력 : 완성된 사다리 배열
func drawHorizontalLine (ladderWithVerticalLine : [[String]]) -> [[String]] {
    var completeLadder = ladderWithVerticalLine
    for indexOfHeight in 0...(completeLadder.count - 1) {
        for indexOfBlock in 1...(completeLadder[indexOfHeight].count - 1) {
            if indexOfBlock % 2 == 1 {
                let drawLine = makeRandomHorizontalLine()
                switch indexOfBlock {
                case 1:
                    if drawLine == true{ //가로줄을 넣을 첫번째 인덱스일 경우
                        completeLadder[indexOfHeight][indexOfBlock] = "-"
                    } else {
                        completeLadder[indexOfHeight][indexOfBlock] = " "
                    }
                default:
                    if drawLine == true && completeLadder[indexOfHeight][indexOfBlock - 2] != "-"{ //이전 블록에서 가로줄이 그어졌는지 확인
                        completeLadder[indexOfHeight][indexOfBlock] = "-"
                    } else {
                        completeLadder[indexOfHeight][indexOfBlock] = " "
                    }
                }
                continue
            }
        }
    }
    return completeLadder
}
//완성된 사다리 배열을 문자열로 변환해 출력하는 함수
//입력 : 완성된 사다리 배열
func printShapeOfLadder (ladderSet : [[String]]) {
    var shapeOfLadder : String = ""
    for indexOfHeight in 0...(ladderSet.count - 1) {
        for indexOfBlock in 0...(ladderSet[indexOfHeight].count - 1) {
            shapeOfLadder += ladderSet[indexOfHeight][indexOfBlock]
        }
        shapeOfLadder += "\n"
    }
    print(shapeOfLadder)
}
//메인함수
var runLadderGame : Bool = true
while runLadderGame == true {
    print("종료를 원하시면 q 또는 quit를 입력해주세요.")
    print("참여할 사람은 몇 명인가요?")
    let entry = readLine()
    if entry == "q" || entry == "quit" {
        break
    }
    print("최대 사다리 높이는 몇 개인가요?")
    let heightOfLadder = readLine()
    let ladderWithVerticalLine = drawVerticalLine(entryVal: Int(entry!)!, heightVal: Int(heightOfLadder!)!)
    printShapeOfLadder(ladderSet: drawHorizontalLine(ladderWithVerticalLine: ladderWithVerticalLine))
}
