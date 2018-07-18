//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderElements = (person:Int, ladder:Int)

enum Foothold {
    case `default`
    case have
    case none
    
    func description() -> String {
        switch self {
        case .default:
            return "|"
        case .have:
            return "-|"
        case .none:
            return " |"
        }
    }
}

func main(){
    let ladderElements:LadderElements = (person: getPerson(), ladder: getLadder())
    
    let ladders:[[Foothold]] = makeLadder(elements: ladderElements)
  
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
func printLadders(elements:[[Foothold]]){
    for valueX in 0..<elements.count {
        print(takeOutFloor(elements: elements, valueX: valueX))
    }
}

func takeOutFloor(elements:[[Foothold]], valueX:Int) -> String{
    var element:String = ""
    for valueY in 0..<elements[valueX].count {
        element.append(elements[valueX][valueY].description())
    }
    return element
}

// 사다리 발판 값을 변경하는 함수
func switchHaveLadderValue(value:Int) -> Int {
    // only : 0 or 1
    guard value == 0 else {
        return 0
    }
    return 1
}

// 검증 하는 함수
func verifyDuplication(first:Foothold, second:Foothold, select:Int) -> Foothold {
    guard first == Foothold.have && second == Foothold.have else {
        return haveHorizontalLadder(have: select)
    }
    return haveHorizontalLadder(have: switchHaveLadderValue(value: Int(select)))
}

// 사다리의 층 만드는 함수
func makeFloor( element: Int) -> Array<Foothold> {
    var floor = Array<Foothold>()
    floor.append(Foothold.default) // Default Setting
    
    for _ in 1..<element {
        let select = Int(arc4random_uniform(2))
        
        let lastElement = floor.last
        let newElement = haveHorizontalLadder(have: Int(select))
        
        floor.append(verifyDuplication(first: lastElement!, second: newElement, select: select))
    }
    
    return floor
}

// 사다리 만드는 함수
func makeLadder(elements:LadderElements) -> [[Foothold]] {
    var ladders = [[Foothold]]()
    
    for _ in 0..<elements.ladder {
        ladders.append(makeFloor(element: elements.person))
    }
    
    return ladders
}

func haveHorizontalLadder(have:Int) -> Foothold {
    // only : 0 or 1
    guard have == 0 else {
        return Foothold.have
    }
    return Foothold.none
}

main()
