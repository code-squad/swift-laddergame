//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation
// 사다리(-) 랜덤 생성 함수. 사다리가 있는 경우, 사다리 위치를 가리키는 인덱스에 true값 넣어 배열 반환.
func makeTransverseLineBetween(row: Int, col: Int)->[[Bool]]{
    // 랜덤 시드값
    let maxNumberOfCol = UInt32(col-1)
    let maxNumberOfRow = UInt32(row)
    // 여러 개의 사다리(-) 위치를 담을 배열. 원소는 false로 채운다. 사다리가 있는 경우 true로 바꿀 예정.
    var transLinePos: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: col-1), count: Int(row))
    // 사다리가 꽉 차지 않도록 사다리 개수를 전체 공간의 1/2 로 한다.
    var maxLines = (maxNumberOfRow * maxNumberOfCol) / 2
    
    // 모든 공백(| |)을 돌면서
    for _ in 0..<(maxNumberOfRow * maxNumberOfCol) {
        // 사다리 개수 소진 시 탈출.
        if maxLines < 1 { break }
        // 사다리(-)가 그려질 위치값(row,col)을 랜덤으로 계산.
        let rowPos = Int(arc4random_uniform(maxNumberOfRow))
        let colPos = Int(arc4random_uniform(maxNumberOfCol))
        // 배열의 해당 위치의 값을 true로 변경.
        transLinePos[rowPos][colPos] = true
        maxLines -= 1
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

