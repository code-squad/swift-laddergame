//
//  ResultView.swift
//  test2
//
//  Created by Mrlee on 2017. 10. 26..
//  Copyright © 2017년 Mrlee. All rights reserved.
//
import Foundation

struct ResultView {
    var ladderInfo: LadderInfo = LadderInfo()
    var nameLength: Int = 0
    var playerNames: String = ""
    
    func printLadder(){
        for outerArrayIndex in 0..<ladderInfo.rowNumber {
            printLadderInner(outerArrayIndex)
            print()
        }
        separateNames()
    }
    
    private func printLadderInner(_ rowIndex: Int){
        let formattedName = ladderInfo.spaceLine.withCString { String(format: "%\(nameLength / 2)s", $0) } //반복되니까 수정해야한다 //DEBUG_ONLY
        print("\(formattedName)", terminator: "")
        for columnIndex in 0..<ladderInfo.columnNumber {
            columnIndex % 2 == 0 ? print("\(ladderInfo.vertiLine)", terminator: "") : selectHorizontalLine(rowIndex, columnIndex)
        }
    }
    
    private func selectHorizontalLine(_ rowIndex: Int, _ colIndex: Int){
        ladderInfo.frames[rowIndex][colIndex].contains(ladderInfo.horizLine) ? printHorizontalLine() : printWhiteSpaceLine()
    }
    
    private func printHorizontalLine(){
        for _ in 0..<nameLength {
            print("\(ladderInfo.horizLine)", terminator: "")
        }
    }
    
    private func printWhiteSpaceLine(){
        for _ in 0..<nameLength {
            print("\(ladderInfo.spaceLine)", terminator: "")
        }
    }
    
    private func separateNames(){
        let ladderPlayer: LadderPlayer = LadderPlayer(name: playerNames)
        var names = ladderPlayer.name.split(separator: ",")
        for indexOfNames in 0..<names.count {
            //가운데정렬 names의 캐릭터카운트 값이 설정한 길이의(5) 평균값 보다 작거나 같으면
            //5/2 = 2 , if inputString < (5/2)+1 --> 가운데정렬
            (names[indexOfNames].count <= nameLength / 2) ? arrangeCenterName(names, indexOfNames) : arrangeName(names, indexOfNames)
        }
    }
    
    private func arrangeCenterName(_ names: [String.SubSequence], _ indexOfNames: Int){
        let nameWhiteSpace = (nameLength / 2) + 1
        let formattedName = names[indexOfNames].withCString { String(format: "%\(nameWhiteSpace)s", $0) } //closure function..?
        print("\(formattedName) ", terminator: "")
    }
    
    private func arrangeName(_ names: [String.SubSequence], _ indexOfNames: Int){
        let formattedName = names[indexOfNames].withCString { String(format: "%-\(nameLength)s", $0) } //closure function..?
        print("\(formattedName) ", terminator: "")
    }
}
