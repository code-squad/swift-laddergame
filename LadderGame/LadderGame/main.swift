//  main.swift
//  LadderGame
//  Created by Jack.
import Foundation
//"-"를 그릴지 그리지 않을지 결정하는 함수
//return : true 또는 false
func makeRandomHorizontalLine () -> Bool {
    let RandomNum : UInt32 = arc4random_uniform(2)
    guard RandomNum == 0 else { return false }
    return true
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

//가로줄이 그려진 사다리 배열에 세로줄을 그려 출력하는 함수
//입력 : 가로줄이 들어가 있는 사다리 배열
func drawVerticalLines (_ ladderWithHorizontalLine : [String]) {
    for horizontalLine in ladderWithHorizontalLine {
        print("|" + horizontalLine, terminator: "")
    }
    print("|")
}
//세로줄을 포함한 완성된 사다리 모양을 문자열로 출력하는 함수
//입력 : 가로줄이 들어가 있는 2차원 사다리 배열
func printCompleteLadder (ladderSet : [[String]]) {
    for indexOfHeight in 0..<ladderSet.count {
        drawVerticalLines(ladderSet[indexOfHeight])
    }
}
//메인함수
let runLadderGame : Bool = true
while runLadderGame == true {
    print("종료를 원하시면 q를 입력해주세요." + "\n" + "참여할 사람은 몇 명인가요?")
    let entry = readLine()
    guard entry != "q" else { break }
    print("최대 사다리 높이는 몇 개인가요?")
    let heightOfLadder = readLine()
    guard heightOfLadder != "q" else { break }
    if let inputEntry = entry, let inputHeight = heightOfLadder {
            let Ladder = generateSetOfLadder(entryVal: (Int(inputEntry)) ?? 0, heightVal: Int(inputHeight) ?? 0)
            let incompleteLadder = drawLadderWithHorizontalLines(ladderSet: Ladder)
            printCompleteLadder(ladderSet: incompleteLadder)
        }
    }
