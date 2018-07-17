//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderElements = (person:Int, ladder:Int)

func main(){
    
    let ladderElements:LadderElements = (person: getPerson(), ladder: getLadder())
    
    let ladders:[[String]] = makeLadder(elements: ladderElements)
  
    // print
    printLadders(elements: ladders)
    
}

// 입력 받는 함수
func getPerson() -> Int {
    print("참여할 사람은 몇 명 인가요?")
    let inputPerson:String = readLine()!
    return Int(inputPerson)!
}
func getLadder() -> Int {
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadder:String = readLine()!
    return Int(inputLadder)!
}


// 결과 출력 함수
func printLadders(elements:[[String]]){
    
    for x in 0..<elements.count {
        var element:String = ""
        for y in 0..<elements[x].count {
            element.append(elements[x][y])
        }
        print(element)
    }
    
}

// 사다리 만드는 함수
func makeLadder(elements:LadderElements) -> [[String]] {
    var ladders = [[String]]()
    // 사다리 높이
    for _ in 0..<elements.ladder {
        // 사람인원에 따른 사다리 개수
        var floor = Array<String>()
        floor.append(defaultVertical())
        for _ in 1..<elements.person {
            let select = arc4random_uniform(2)
            floor.append(haveHorizontalLadder(have: Int(select)))
        }
        ladders.append(floor)
    }
    
    return ladders
}

func defaultVertical() -> String {
    return "|"
}
func falseHorizontalLadder() -> String {
    return " |"
}
func trueHorizontalLadder() -> String {
    return "-|"
}
func haveHorizontalLadder(have:Int) -> String {
    // only : 0 or 1
    if have == 0 {
        return falseHorizontalLadder()
    }else {
        return trueHorizontalLadder()
    }
}

main()
