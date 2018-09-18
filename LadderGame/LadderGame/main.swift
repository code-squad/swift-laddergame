//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//
//  Modified by Jamie.

// 사다리의 열을 만들어 [Bool] 리턴
func makeLadderRow(rowIndex:Int) -> [Bool] {
    var ladderSteps : [Bool] = Array(repeating: false, count: rowIndex)
    for index in ladderSteps.indices {
        if (index==0) {
            ladderSteps[index] = Bool.random()
            continue
        } else if (ladderSteps[index-1]) {
            continue
        } else {
            ladderSteps[index] = Bool.random()
        }
//        * 위의 if문과 같은 기능의 guard-else 구문
//        guard !(index==0) else {
//            ladderSteps[index] = Bool.random()
//            continue
//        }
//        guard (!ladderSteps[index-1]) else { continue }
//        ladderSteps[index] = Bool.random()
    }
    return ladderSteps
}

// makeLadderRow()함수를 호출하여 사다리 행까지 완성하여 [[Bool]] 리턴
func makeLadders(_ maxHeight:Int, _ numberOfPeople:Int) -> [[Bool]] {
    var ladders : [[Bool]] = []
    for _ in 1...maxHeight {
        ladders.append(makeLadderRow(rowIndex: (numberOfPeople-1)))
    }
    return ladders
}

// 전달받은 [[Bool]]을 사다리 모양으로 출력
func printLadders(_ ladders:[[Bool]]) {
    for column in ladders {
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
    var input:String = readLine()!
    guard let numberOfPeople:Int = Int(input) else { return }
    
    print("최대 사다리 높이는 몇 개인가요?")
    input = readLine()!
    guard let maxHeight:Int = Int(input) else { return }
    
    let ladders = makeLadders(maxHeight, numberOfPeople)
    printLadders(ladders)
}

// 실행
execute()
