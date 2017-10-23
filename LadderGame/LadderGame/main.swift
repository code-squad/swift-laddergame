//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

func makeRandomTransverseLine(_ currRow: Int, _ currCol: Int, _ maxNumberOfCol: Int){
    // 사다리(-)가 그려질 위치값(row,col)을 랜덤으로 계산.
    let colPos = Int(arc4random_uniform(UInt32(maxNumberOfCol)))
    
    // 여러 개의 사다리(-) 위치를 담을 배열. 원소는 false로 채운다. 사다리가 있는 경우 true로 바꿀 예정.
    var transLinePos: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: col-1), count: Int(row))
    
    // 현재 줄(row)의 이전 열(col)에 사다리가 있는 경우는 패스. 사다리 개수 제한.
    if currCol > 0 && transLinePos[currRow][currCol-1] != true && maxNumOfLadder > 0{
        transLinePos[currRow][colPos] = true
        maxNumOfLadder -= 1
    }
}

// 사다리(-) 랜덤 생성 함수. 사다리가 있는 경우, 사다리 위치를 가리키는 인덱스에 true값 넣어 배열 반환.
func makeTransverseLineBetween(row: Int, col: Int)->[[Bool]]{
    let maxNumberOfCol = col - 1    // 사다리가 그려질 세로(column) 공간의 개수는 사람수보다 1개 작음.(사이공간이므로)
    var maxNumOfLadder = Int(round(Double(maxNumberOfCol) / 2)) * row   // 사다리 개수 제한: 한 줄(row)에 여러 사다리가

    // 모든 공백(| |)을 돌면서
    for currRow in 0..<row {
        for currCol in 0..<maxNumberOfCol {
            makeRandomTransverseLine(currRow, currCol, maxNumberOfCol)
        }
    }
    return transLinePos
}

// 전체 사다리 출력 함수.
func drawLadder(withRowOf rows: Int, withColOf cols: Int){
    // 랜덤으로 사다리(-) 생성.
    let transLinePos = makeTransverseLineBetween(row: rows, col: cols)
    
    for rows in transLinePos{
        for elem in rows{
            // 좌측 세로줄 출력.
            print("|", terminator: "")
            if elem {
                // 사다리가 있으면 출력.
                print("-", terminator:"")
            }else{
                // 사다리가 없으면 공백 출력.
                print(" ", terminator:"")
            }
        }
        // 우측 세로줄 출력 및 개행.
        print("|")
    }
}

while(true){
    print("참여할 사람은 몇 명 인가요? ", terminator: " ")
    guard let numberOfPeopleInString = readLine(), let numberOfPeople = Int(numberOfPeopleInString) else{ break }
    print("최대 사다리 높이는 몇 개인가요? ", terminator: " ")
    guard let ladderHeightInString = readLine(), let ladderHeight = Int(ladderHeightInString) else{ break }
    // 사용자 입력값으로 사다리 출력 함수 호출.
    drawLadder(withRowOf: ladderHeight, withColOf: numberOfPeople)
}

