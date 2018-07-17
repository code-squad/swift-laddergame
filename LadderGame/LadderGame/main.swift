//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias DoubleString = (person:String, ladder:String)
typealias DoubleInt = (person:Int, ladder:Int)

func main(){
    
    let inputValue:DoubleString = getInputValue()
    
    let ladderElements:DoubleInt = convertStringToInt(elements: inputValue)
    
    let ladders:[[String]] = makeLadder(elements: ladderElements)
    
    // print
    printLadders(elements: ladders)
    
}

func printLadders(elements:[[String]]){
    
    for x in 0..<elements.count {
        var element:String = ""
        for y in 0..<elements[x].count {
            element.append(elements[x][y])
        }
        print(element)
    }
    
}

// 입력 받는 함수
func getInputValue() -> DoubleString{
    
    print("참여할 사람은 몇 명 인가요?")
    let inputPerson:String = readLine()!
    print("최대 사다리 높이는 몇 개인가요?")
    let inputLadder:String = readLine()!
    
    let inputValue:DoubleString = (person: inputPerson, ladder: inputLadder)
    return inputValue
}

//  함수
func convertStringToInt(elements:DoubleString) -> DoubleInt {
    
    let person:Int = Int(elements.person)!
    let ladder:Int = Int(elements.ladder)!
    
    let intValue:DoubleInt = (person: person, ladder: ladder)
    
    return intValue
}

// 사다리 만드는 함수
func makeLadder(elements:DoubleInt) -> [[String]] {
    var ladderArr = [[String]]()
    // 사다리 높이
    for _ in 0..<elements.ladder {
        // 사람인원에 따른 사다리 개수
        var innerArr = Array<String>()
        innerArr.append(defaultColumn())
        for _ in 1..<elements.person {
            let select = arc4random_uniform(2)
            innerArr.append(selectColumn(i: Int(select)))
        }
        ladderArr.append(innerArr)
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
