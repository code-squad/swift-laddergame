//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer{
    private let name : String
    
    init (name:String) throws {
        guard name.count < 5 else {
            throw ErrorType.longName
        }
        guard name.count < 1 else {
            throw ErrorType.emptyValue
        }
        self.name = name
    }
    func getName()->(String){
        return self.name
    }
    
}
