//
//  ResultView.swift
//  LadderGame
//
//  Created by oingbong on 2018. 7. 19..
//  Copyright © 2018년 Codesquad Inc. All rights reserved.
//

import Foundation

struct ResultView {
    var results:Array<String> = Array<String>()
    
    public func printLadders(){
        for result in results {
            print(result)
        }
    }
    
    public func printPlayer(elements: LadderGame){
        //      |-----|-----|-----|-----|
        //    12345 12345 12345 12345 12345
        var ladderName:Array<String> = Array<String>()
        for name in elements.names {
            let n:String = addBlank(name: name.name)
            ladderName.append(n)
            print(n, separator: "", terminator: " ")
        }
    }
    
    mutating func setLadders(elements:[[LadderStep]]){
        var ladder:Array<String> = Array<String>()
        for valueX in 0..<elements.count {
            ladder.append(takeOutFloor(elements: elements, valueX: valueX))
        }
        
        self.results = ladder
    }
    
    private func takeOutFloor(elements:[[LadderStep]], valueX:Int) -> String{
        var element:String = ""
        for valueY in 0..<elements[valueX].count {
            element.append(elements[valueX][valueY].description())
        }
        return element
    }
    
    private func blank(count:Int) -> String {
        var result = ""
        for _ in 0..<count {
            result.append(" ")
        }
        return result
    }
    
    // 이름에 공백 추가하는 함수
    private func addBlank(name:String) -> String{
        var result:String = ""
        let pivotNumber = 5 - name.count
        let backNumber = blank(count: pivotNumber / 2)
        let frontNumber = blank(count: 5 - name.count - backNumber.count)
        result.append(frontNumber)
        result.append(name)
        result.append(backNumber)
        return result
    }
    
}
