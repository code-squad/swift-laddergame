//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation


func receiveInput() -> (columnString: String, rowString: String) {
    print("참여할 사람은 몇 명입니까?")
    let optionalColumnString = readLine()
    print("최대 사다리 높이는 몇 층인가요?")
    let optionalRowString = readLine()
    if let columnString = optionalColumnString, let rowString = optionalRowString {
        return (columnString, rowString)
    }
    return ("nil", "nil")
}

func checkInputValue(columnString: String, rowString: String) -> (columnNumber: UInt, rowNumber: UInt) {
    if let columnNumber = UInt(columnString), let rowNumber = UInt(rowString) {
        return (columnNumber, rowNumber)
    }
    return (0,0)
}

//test
let inputValue = receiveInput()
print("inputValue : \(inputValue)")

let checkedInput = checkInputValue(columnString: inputValue.columnString, rowString: inputValue.rowString)
print("checkedInput : \(checkedInput)")

func createVerticalLines(rowNumber: UInt) -> [String] {
    let VerticalLine = Array(repeating: "|", count: Int(rowNumber))
    return VerticalLine
}

func createHorizontalLines(rowNumber: UInt) -> [String] {
    var horizontalLine: [String] = Array()
    for _ in 0..<rowNumber-1 {
        horizontalLine.append(flipForBar())
    }
    return horizontalLine
}

func flipForBar() -> String {
    let bar = arc4random_uniform(2)
    if bar == 1 {
        return "—"
    } else {
        return " "
    }
}

//test
let verticalLines = createVerticalLines(rowNumber: checkedInput.rowNumber)
let horizontalLines = createHorizontalLines(rowNumber: checkedInput.rowNumber)

print("vertical : \(verticalLines)")
print("horizontal : \(horizontalLines)")


func checkLinesOddEven(ladderIndex: UInt, columnNumber: UInt, rowNumber: UInt) -> [String] {
    if ladderIndex % 2 == 1 {
        return createVerticalLines(rowNumber: rowNumber)
    } else {
        return createHorizontalLines(rowNumber: rowNumber)
    }
}

func createWholeLadder(columnNumber: UInt, rowNumber: UInt) -> [[String]] {
    var ladder: [[String]] = Array()
    for i in 0..<columnNumber*2-1 {
        let partialArray: [String] = checkLinesOddEven(ladderIndex: i+1, columnNumber: columnNumber, rowNumber: rowNumber)
        ladder.append(partialArray)
    }
    return ladder
}

//test
let wholeLadder = createWholeLadder(columnNumber: checkedInput.columnNumber, rowNumber: checkedInput.rowNumber)
print(wholeLadder)

//func printLadder() {
//
//}
