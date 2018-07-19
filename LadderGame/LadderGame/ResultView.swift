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
    
    func printLadders(){
        for result in results {
            print(result)
        }
    }
    
    func printPlayer(elements: LadderGame){
        //      |-----|-----|-----|-----|
        //    12345 12345 12345 12345 12345
        var ladderName:Array<String> = Array<String>()
        for name in elements.names {
            let n:String = addBlank(name: name.name)
            ladderName.append(n)
            print(n, separator: "", terminator: " ")
        }
    }
    
    mutating func setLadders(elements:[[LadderStep.Step]]){
        var ladder:Array<String> = Array<String>()
        for valueX in 0..<elements.count {
            ladder.append(takeOutFloor(elements: elements, valueX: valueX))
        }
        
        self.results = ladder
    }
    
    func takeOutFloor(elements:[[LadderStep.Step]], valueX:Int) -> String{
        var element:String = ""
        for valueY in 0..<elements[valueX].count {
            element.append(elements[valueX][valueY].description())
        }
        return element
    }
    
}
