//
//  File.swift
//  LadderGame
//
//  Created by Kims on 2018. 10. 10..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

// 사다리의 열을 만들어 [Bool] 리턴
func makeLadderRow(num:Int) -> [Bool] {
    var row : [Bool] = Array(repeating: false, count: num)
    for idx in row.indices {
        if (idx==0) {
            row[idx] = Bool.random()
        } else if (row[idx-1]==true) {
            row[idx] = false
        } else {
            row[idx] = Bool.random()
        }
    }
    return row
}
// makeLadderRow()함수를 호출하여 사다리 행까지 완성하여 [[Bool]] 리턴
func makeLadder(height:Int, people:Int) -> [[Bool]] {
    var ladder : [[Bool]] = []
    for _ in 1...height {
        ladder.append(makeLadderRow(num: (people-1)))
    }
    return ladder
}
// 전달받은 [[Bool]]을 사다리 모양으로 출력
func printLadder(_ ladder:[[Bool]]) {
    for column in ladder {
        print("", terminator: "|")
        for row in column {
            if(row==true) {
                print("-", terminator: "|")
            } else {
                print(" ", terminator: "|")
            }
        }
        print("")
    }
}
// 두 입력값이 정수형일 경우에만 makeLadder()로 리턴받은 [[Bool]]을 printLadder()로 출력 실행
func execute() {
    print("참여할 사람은 몇 명 인가요?")
    if let people = Int(readLine()!) {
        print("최대 사다리 높이는 몇 개인가요?")
        if let height = Int(readLine()!) {
            let ladder = makeLadder(height: Int(height), people: Int(people))
            printLadder(ladder)
        } else {
            print("숫자를 입력하세요.")
        }
    } else {
        print("숫자를 입력하세요.")
    }
}
// 실행

execute()
