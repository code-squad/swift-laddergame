//
//  LadderGame.swift
//  LadderGame
//
//  Created by 심 승민 on 2017. 10. 23..
//  Copyright © 2017년 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderGame {
    var heights: Int
    var names: [LadderPlayer]
    var numberOfPlayer: Int{ return names.count }
    
    // 한 줄(row)의 사다리 랜덤 위치 생성. 생성된 랜덤 위치의 좌우에 사다리가 있는 경우, 패스함.(nil 반환)
    func generateRandomLadderPos(_ maxColSpace: Int, ladderPosArr: [Bool])->Int?{
        let colPos: Int = Int(arc4random_uniform(UInt32(maxColSpace)))
        let leftOfCurrCol: Int = (colPos-1 > -1) ? colPos-1 : 0
        let rightOfCurrCol: Int = (colPos+1 < maxColSpace) ? colPos+1 : maxColSpace-1
        
        // 사다리(-)가 그려질 위치값(row,col)을 랜덤으로 계산.
        guard ladderPosArr[leftOfCurrCol] != true || ladderPosArr[rightOfCurrCol] != true else{ return nil }
        return colPos
    }
    
    // 한 줄(row)의 사다리 위치 반환.
    func makeTransverseLineInARow(in currRow: Int, _ maxColSpace: Int)->[Bool]{
        // 한 줄(row)의 사다리 위치를 넣을 배열. 원소들의 디폴트값은 false.
        var transLinePosInARow: [Bool] = [Bool](repeating: false, count: maxColSpace)
        // 사용 가능한 최대 사다리 개수 - 전체 열(col)의 절반. 반올림.
        var maxNumOfLadders = Int(round(Double(maxColSpace)/2) + 1)
        
        for _ in 0..<maxColSpace{
            // 사다리 랜덤 위치값 생성.
            let colPos = generateRandomLadderPos(maxColSpace, ladderPosArr: transLinePosInARow)
            // nil인 경우, break. --> 해당 위치는 기본값인 false 유지.
            guard let ladderPos = colPos else{ break }
            // 위치값이 있는 경우, 해당 위치는 true 값으로 변경.
            transLinePosInARow[ladderPos] = true
            // 사용가능한 사다리 개수를 한 개 줄임.
            maxNumOfLadders -= 1
        }
        
        return transLinePosInARow
    }
    
    // 전체 사다리(-) 위치 반환. 사다리가 있는 경우, 사다리 위치를 가리키는 인덱스에 true값 넣어 배열 반환.
    func makeTransverseLineBetween(_ row: Int, and col: Int)->[[Bool]]{
        // 사다리가 그려질 세로(column) 공간의 개수는 사람수보다 1개 작음.(사이공간이므로)
        let maxNumberOfCol = col - 1
        // 여러 개의 사다리(-) 위치를 담을 배열. 원소는 false로 채운다. 사다리가 있는 경우 true로 바꿀 예정.
        var transLinePos: [[Bool]] = []
        
        // 모든 공백(| |)을 돌면서
        for currRow in 0..<row {
            // 한 줄(row)의 랜덤 사다리 위치를 계산.
            let ladderInARow = makeTransverseLineInARow(in: currRow, maxNumberOfCol)
            // 전체 배열에 한 줄의 사다리 배열을 붙임.
            transLinePos.append(ladderInARow)
        }
        return transLinePos
    }
    
    func printTransverseLine(_ transverseLineExist: Bool){
        if transverseLineExist {
            // 사다리가 있으면 출력.
            print("-----", terminator:"")
        }
    }
    
    func printEmptySpace(_ transverseLineExist: Bool){
        if !transverseLineExist{
            // 사다리가 없으면 공백 출력.
            print("     ", terminator:"")
        }
    }
    
    func printVerticalLine(hasLineFeed: Bool){
        guard hasLineFeed else{
            // 출력. (좌측 세로줄)
            print("|", terminator: "")
            return
        }
        // 출력 및 개행. (우측 세로줄)
        print("|")
    }
    
    // 한 줄(row)의 사다리를 출력.
    func drawLadderOf(row currRows: [Bool]){
        for elem in currRows{
            printVerticalLine(hasLineFeed: false)   // 첫 '|' 출력.
            printTransverseLine(elem)               // 사다리가 있으면 사다리 출력.
            printEmptySpace(elem)                   // 사다리 없으면 공백 출력.
        }
    }
    
    func printNames(){
        // 플레이어 이름 출력.
        for player in self.names{
            print(player.name, terminator: "  ")
        }
    }
    
    // 전체 사다리 출력 함수.
    func drawLadder(){
        // 랜덤으로 사다리(-) 생성.
        let transLinePos = makeTransverseLineBetween(self.heights, and: self.numberOfPlayer)
        // 모든 줄(row) 출력.
        for rows in transLinePos{
            drawLadderOf(row: rows)                 // 한 줄(row) 출력.
            printVerticalLine(hasLineFeed: true)    // 한 줄이 끝나면 마지막 '|' 출력 후 개행.
        }
        printNames()
    }
}
