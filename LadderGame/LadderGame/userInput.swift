//
//  userInput.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInput{
    var requestNumber : String? {
        return readLine()
    }
    
    var convertedString = " "
    
    func removeOptional ()->String{
        let fail = "removeOptional fail"
        if let convertedString = requestNumber{
            return convertedString
        }
        return fail
    }
    
    var convertedInt = 0
    
    func convertInt ()->Int{
        let fail = 0
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        return fail
    }

    mutating func isString()->Bool{
        if convertedString == "removeOptional fail" {
            return false
        }
        return true
    }
    
    mutating func isInt ()->Bool{
        if convertedInt == 0 {
            return false
        }
        return true
    }
    
    func isOverOne()->Bool{
        guard convertedInt > 1 else {
            return false
        }
        return true
    }
    
    let playerNumberRequestMassage = "플레이어 수"
    let ladderHeightRequestMassage = "사다리 높이"
    
    func printRquestMassage(_ RequestMassage:String) -> (String,String) {
        let RequestMassage = RequestMassage + "를 입력하세요"
        let ReRequestMassage = "최소" + RequestMassage + "는 2입니다," + RequestMassage + "를 다시 입력해주세요"
        return (RequestMassage,ReRequestMassage)
    }
    
    mutating func printErrorMassage(_ Error:Bool) {
        if Error == false {
            print("값을 다시 확인하고 입력하세요")
        }
    }

    mutating func ladderBoardInitNumber(_ RequestMassage:String){
        var isString: Bool
        var isInt : Bool
        var isOverOne : Bool
        let printRquestMassage = self.printRquestMassage(RequestMassage)
        repeat {
            convertedInt = 0
            print(printRquestMassage.0)
            convertedString = removeOptional()
            isString = self.isString()
            printErrorMassage(isString)
            
            convertedInt = convertInt()
            isInt = self.isInt()
            printErrorMassage(isInt)
            
            isOverOne = self.isOverOne()
            printErrorMassage(isOverOne)
        } while (isString && isInt && isOverOne) == false
    }
}





