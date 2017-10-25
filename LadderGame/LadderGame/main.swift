//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

struct Ladder {
    var innerArr: [String] = [""]
    var outerArr: [[String]] = [[""]]
    var realColNum: Int = 0
    var realRowNum: Int = 0
    
    mutating func makeLadder(_ col: Int, _ row: Int){
        realColNum = (col - 1) + col
        realRowNum = row
        innerArr = [String](repeating: "|", count: realColNum)
        outerArr = [[String]](repeating: innerArr, count: realRowNum)
    }
    
    mutating func makeRandomLine(){
        var flag: Bool = true
        for seqOfOutArr in 0..<realRowNum {
            for seqOfInArr in 0..<realColNum {
                let randomVal: Bool = arc4random_uniform(2) % 2 == 0 ? true : false
                if seqOfInArr % 2 != 0 { (flag && randomVal) ? (flag = makeHrozLine(seqOfOutArr, seqOfInArr)) : (flag = makeSpaceLine(seqOfOutArr, seqOfInArr)) }
            }
        }
    }
    
    mutating func makeHrozLine(_ seqOfOutArr: Int, _ seqOfInArr: Int) -> Bool{
        outerArr[seqOfOutArr][seqOfInArr] = "-"
        return false
    }

    mutating func makeSpaceLine(_ seqOfOutArr: Int, _ seqOfInArr: Int) -> Bool{
        outerArr[seqOfOutArr][seqOfInArr] = " "
        return true
    }
    
    func printLadder(){
        for seqOfOutArr in 0..<realRowNum {
            for seqOfInArr in 0..<realColNum{
                print("\(outerArr[seqOfOutArr][seqOfInArr])", terminator: "")
            }
            print()
        }
    }
}

func inputExecute(_ col: String?, _ row: String?){
    guard let col = Int(col!), let row = Int(row!) else {
        print("입력오류")
        return
    }
    var ladder: Ladder = Ladder()
    ladder.makeLadder(col, row)
    ladder.makeRandomLine()
    ladder.printLadder()
}

print("참여할 사람은 몇 명인가요?")
let peopleNum = readLine()
print("최대 사다리 높이는 몇 개인가요?")
let ladderNum = readLine()
inputExecute(peopleNum, ladderNum)
