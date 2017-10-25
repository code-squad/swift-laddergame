//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
import Foundation

func makeLadder(col: String?, row: String?){
    guard let col = Int(col!), let row = Int(row!) else {
        print("입력오류")
        return
    }
    drawLadder(col, row)
}

func drawLadder(_ peopleNum: Int, _ ladderNum: Int){
    let countNum = (peopleNum - 1) + peopleNum
    let innerArr = [String](repeating: "|", count: countNum)
    var outerArr = [[String]](repeating: innerArr, count: ladderNum)
    var flag: Bool = true
    for i in 0..<ladderNum{
        //true 면 사다리 존재
        for j in 0..<countNum{
            if j % 2 == 0{
                print(outerArr[i][j], terminator: "")
            } else {
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
        }
        print()
    }
}

print("참여할 사람은 몇 명인가요?")
let peopleNum = readLine()
print("최대 사다리 높이는 몇 개인가요?")
let ladderNum = readLine()
makeLadder(col: peopleNum, row: ladderNum)
