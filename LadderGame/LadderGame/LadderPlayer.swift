//
//  LadderPlayer.swift
//  LadderGame
//
//  Created by 이동영 on 16/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct LadderPlayer: CustomStringConvertible{
    private let standardLength = 5
    private var name : String
    public var description: String { return getName()}
    init (name:String) throws {
        guard name.count <= standardLength else {
            throw ErrorType.longName
        }
        guard name.count > 0 else {
            print(name)
            throw ErrorType.emptyValue
        }
        self.name = name
        self.nomalize()
    }
    func getName()->(String){
        return self.name
    }
    private mutating func nomalize(){
        let shortage = standardLength - self.name.count
        let startIndex = standardLength/2 - self.name.count/2
        let frontPadding = String.init(repeating: " ", count: startIndex)
        let backPadding = String.init(repeating:" ",count:shortage - startIndex + self.name.count-1)
        self.name = frontPadding + self.name + backPadding
    }
    private func makePadding(length:Int)->(String){
        return String.init(repeating: " ", count: length)
    }
}
