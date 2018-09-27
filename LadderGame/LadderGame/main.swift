//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

// 사다리게임

// 사다리를 출력하는 함수
func printOut(_ ladders: [[String]]) {
    for ladder in ladders {
        printJustOne([ladder.joined(separator: "|")])
    }
}

// 한 단계의 계단을 출력하는 함수
// 사다리 출력 함수 printOut에 종속
func printJustOne(_ ladder: [String]) {
    print("|\(ladder[0])|")
}


// 전체 사다리를 만드는 함수 (2차원 배열)
// 계단 배열을 초기화해주고 각 단계의 계단을 대입
func makeLadderUsing(_ numberOfPeople: Int, _ numberOfStairs: Int) -> [[String]] {
    var ladders = Array(repeating: [String](), count: numberOfStairs)
    
    for j in 0...numberOfStairs-1 {
        ladders[j] = makeOneStairUsing(numberOfPeople)
    }
    
    return ladders
}

// 한 단계의 계단을 만드는 함수
// 전체 사다리를 만드는 함수 makeLadderUsing에 종속
func makeOneStairUsing(_ numberOfPeople: Int) -> [String] {
    let steps = ["-", " "]
    var stair = [String]()
    
    for _ in 1...(numberOfPeople-1) {
        stair.append(steps[Int(arc4random_uniform(2))])
    }
    
    return stair
}


// readLine으로 받은 값을 상수로 바꿔주는 함수
func changeType(input: String) -> Int {
    if let numberOfpeople = Int(input) {
        return numberOfpeople
    } else {
        return 0
    }
}


// 메인 함수
func main() {
    var numbers = Int()
    var steps = Int()
    
    // 사다리를 구성하는 요소(참가인원, 사다리의 높이)를 입력받고 출력
    print("참여할 사람은 몇 명 인가요?")
    if let participant = readLine() {
        numbers = changeType(input: participant)
    }
    
    // 사다리를 만들고 출력하는 부분
    print("최대 사다리 높이는 몇 개 인가요?")
    if let staircase = readLine() {
        steps = changeType(input: staircase)
    }
    
    // 입력받은 값이 올바른지 체크하고 실행하는 부분
    numbers > 1 && steps > 1 ? printOut(makeLadderUsing(numbers, steps))
                             : print("2이상의 숫자만 입력해주세요.")
}

main()
