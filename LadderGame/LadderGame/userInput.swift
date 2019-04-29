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
    
    func RquestMassage(_ RequestMassage:String) -> (String,String,String,String) {
        let LadderBoardInitNumber = RequestMassage + "를 입력하세요"
        let IsStringFalse = "알수없는 값을 입력했습니다"
        let IsIntFalse = "정수를 입력해야 합니다"
        let IsOverOneFalse = "최소" + RequestMassage + "는 2입니다,"
        return (LadderBoardInitNumber,IsStringFalse,IsIntFalse,IsOverOneFalse)
    }
    
    mutating func printErrorMassage(_ isError:Bool, _ ErrorMassage:String) {
        if isError == false {
            print(ErrorMassage)
        }
    }
    
    mutating func requestCorrectNumber(_ RequestMassage:String)->Bool {
        convertedInt = 0
        let (ladderBoardInitNumber,isStringFalse,isIntFalse,isOverOneFalse) = self.RquestMassage(RequestMassage)
        print(ladderBoardInitNumber)
        convertedString = removeOptional()
        let isString = self.isString()
        printErrorMassage(isString, isStringFalse)
        convertedInt = convertInt()
        let isInt = self.isInt()
        printErrorMassage(isInt, isIntFalse)
        let isOverOne = self.isOverOne()
        printErrorMassage(isOverOne, isOverOneFalse)
        return (isString && isInt && isOverOne)
    }

    mutating func ladderBoardInitNumber(_ RequestMassage:String){
        var isCorrectNumber:Bool
        repeat {
           isCorrectNumber = requestCorrectNumber(RequestMassage)
        } while isCorrectNumber == false
    }
}





