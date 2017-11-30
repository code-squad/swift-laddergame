//  main.swift
//  LadderGame
//  Created by Jack.
import Foundation
//"-"를 그릴지 그리지 않을지 결정하는 함수
//return : true 또는 false
func makeRandomHorizontalLine () -> Bool {
    let RandomNum : UInt32 = arc4random_uniform(2)
    if RandomNum == 0 {
        return true
    }
    return false
}
//출력할 사다리를 위한 2차원 배열을 생성하는 함수
//입력 : 참가자수, 사다리 높이의 갯수
//return : 2차원 구조의 사다리 배열
func generateSetOfLadder (entryVal : Int, heightVal : Int) -> [[String]] {
    let setOfLadder : [[String]] = Array(repeatElement(Array(repeatElement("", count: entryVal - 1)), count: heightVal))
    return setOfLadder
}
//하나의 가로줄을 그리거나, 그리지 않는 함수
//입력 : 랜덤값(Bool)
//return : 입력이 True면 "-", false면 " "
func drawOneHorizontalLine (_ randomVal : Bool) -> String {
    if randomVal == true {
        return "-"
    }
    return " "
}
//랜덤으로 결정된 가로줄을 그리는 함수
//입력 : 2차원 배열
//출력 : 가로줄을 입력한 2차원 사다리 배열
func drawHorizontalLines (ladderSet : [[String]]) -> [[String]] {
    var ladderWithHorizontalLine = ladderSet
    for indexOfHeight in 0..<ladderWithHorizontalLine.count {
        for indexOfHorizontalLine in 0..<ladderWithHorizontalLine[indexOfHeight].count {
            let drawLineVal = makeRandomHorizontalLine()
            switch indexOfHorizontalLine {
            case 0 : ladderWithHorizontalLine[indexOfHeight][indexOfHorizontalLine] = drawOneHorizontalLine(drawLineVal)
            default :
                guard ladderWithHorizontalLine[indexOfHeight][indexOfHorizontalLine - 1] != "-" else { //이전 인덱스에 "-"가 있을경우 : " "을 넣는다.
                    ladderWithHorizontalLine[indexOfHeight][indexOfHorizontalLine] = drawOneHorizontalLine(false)
                    continue
                }
                ladderWithHorizontalLine[indexOfHeight][indexOfHorizontalLine] = drawOneHorizontalLine(drawLineVal)
            }
        }
    }
    return ladderWithHorizontalLine
}
//세로줄을 포함한 완성된 사다리 모양을 문자열로 출력하는 함수
//입력 : 가로줄이 들어가 있는 사다리 배열
func printCompleteLadder (ladderSet : [[String]]) {
    var shapeOfLadder : String = ""
    for indexOfHeight in 0..<ladderSet.count {
        for indexOfHorizontalLine in 0..<ladderSet[indexOfHeight].count {
            shapeOfLadder += "|" + ladderSet[indexOfHeight][indexOfHorizontalLine]
        }
        shapeOfLadder += "|" + "\n"
    }
    print(shapeOfLadder)
}
//메인함수
let runLadderGame : Bool = true
while runLadderGame == true {
    print("종료를 원하시면 q 또는 quit를 입력해주세요.")
    print("참여할 사람은 몇 명인가요?")
    let entry = readLine()
    if entry == "q" || entry == "quit" {
        break
    }
    print("최대 사다리 높이는 몇 개인가요?")
    let heightOfLadder = readLine()
    if heightOfLadder == "q" || heightOfLadder == "quit" {
        break
    }
    if let inputEntry = entry {
        if let inputHeight = heightOfLadder {
            let Ladder = generateSetOfLadder(entryVal: (Int(inputEntry)) ?? 0, heightVal: Int(inputHeight) ?? 0)
            let incompleteLadder = drawHorizontalLines(ladderSet: Ladder)
            printCompleteLadder(ladderSet: incompleteLadder)
        }
    }
}

