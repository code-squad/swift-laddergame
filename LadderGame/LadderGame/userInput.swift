//
//  userInput.swift
//  LadderGame
//
//  Created by 이희찬 on 18/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct UserInputManage{
    
    var requestNumber : String? {
        return readLine()
    }
    
    func removeOptional (_ userResponse:String?)->String{
        if let convertedString = userResponse{
            return convertedString
        }
        print("입력할 값을 다시 확인하세요")
        return removeOptional(userResponse)
    }
    
    func convertInt (_ convertedString:String)->Int{
        if let convertedInt = Int(convertedString){
            return convertedInt
        }
        print("입력할 값을 다시 확인하세요")
        return convertInt(removeOptional(requestNumber))
    }
}
