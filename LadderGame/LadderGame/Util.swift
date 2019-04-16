//
//  Util.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

enum ErrorType:String,Error{
    case wrongInput = "입력형식이 맞지않습니다"
    case outOfRange = "숫자범위가 벗어났습니다"
}
struct ErrorHandler{
    func alertErrorMessage(type:ErrorType){
        print("             ❗️\(type.rawValue)❗️")
        print("====================================================")
    }
}


