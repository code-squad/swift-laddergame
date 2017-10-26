//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

var innerArr: [String] = [""]
var outerArr: [[String]] = [[""]]
var countNum: Int = 0
var flag: Bool = true

func makeBaseLadder(peopleNum: Int, ladderNum: Int){
    countNum = (peopleNum - 1) + peopleNum
    innerArr = [String](repeating: "|", count: countNum)
    outerArr = [[String]](repeating: innerArr, count: ladderNum)
}

func makeRandomLine(row i: Int, col j: Int){
    let random: Bool = arc4random_uniform(2) % 2 == 0 ? true : false
    if random && flag {
        outerArr[i][j] = "-"
        print(outerArr[i][j], terminator: "")
        flag = false
    } else {
        outerArr[i][j] = " "
        print(outerArr[i][j], terminator: "")
        flag = true
    }
}

func selectLine(row i: Int) -> Bool{
    //true 면 사다리 존재
    for j in 0..<countNum{
        if j % 2 == 0{
            print(outerArr[i][j], terminator: "")
        } else {
            makeRandomLine(row: i, col: j)
        }
    }
    return flag
}

func drawLadder(peopleNum col: Int, ladderNum row: Int){
    makeBaseLadder(peopleNum: col, ladderNum: row)
    for i in 0..<row{
        flag = selectLine(row: i)
        print()
    }
}

print("참여할 사람은 몇 명인가요?")
var peopleNum = readLine()
print("최대 사다리 높이는 몇 개인가요?")
var ladderNum = readLine()
drawLadder(peopleNum: Int(peopleNum!)!, ladderNum: Int(ladderNum!)!)

