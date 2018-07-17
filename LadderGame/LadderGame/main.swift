//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias DoubleInt = (person:Int, ladder:Int)

func main(){
    
    let value:DoubleInt = convertValue()
    
    let ladders:Array<String> = makeLadder(value: value)
    
    // print
    for ladder in ladders {
        print(ladder)
    }
    
}

// 입력 관련 함수
func convertValue() -> DoubleInt {
    
    print("참여할 사람은 몇 명 인가요?")
    let inputPerson = readLine()
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadder = readLine()
    
    var person:Int = 0
    var ladder:Int = 0
    if let p = inputPerson {
        print("person : \(p)")
        person = Int(p)!
    }
    if let d = inputLadder {
        print("ladder : \(d)")
        ladder = Int(d)!
    }
    
    let value:DoubleInt = (person: person, ladder: ladder)
    
    return value
}

// 사다리 만드는 함수
func makeLadder(value:DoubleInt) -> Array<String> {
    var ladderArr = Array<String>()
    // 사다리 높이
    for _ in 1...value.ladder {
        // 사람인원에 따른 사다리 개수
        var column:String = defaultColumn()
        for _ in 2...value.person {
            let select = arc4random_uniform(2)
            column.append(selectColumn(i: Int(select)))
        }
        ladderArr.append(column)
    }
    return ladderArr
}

func defaultColumn() -> String {
    return "|"
}
func falseColumn() -> String {
    return " |"
}
func trueColumn() -> String {
    return "-|"
}
func selectColumn(i:Int) -> String {
    if i == 0 {
        return falseColumn()
    }else {
        return trueColumn()
    }
}

main()
