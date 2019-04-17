//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer{
    let standardLength = 5
    private var name : String
    
    init (name:String) throws {
        guard name.count <= standardLength else {
            throw ErrorType.longName
        }
        guard name.count > 1 else {
            print(name)
            throw ErrorType.emptyValue
        }
        self.name = name
        self.nomalize()
    }
    func getName()->(String){
        return self.name
    }
    mutating func nomalize(){
        let shortage = standardLength - self.name.count
        self.name.append(contentsOf: String.init(repeating: " ", count: shortage))
    }
}
