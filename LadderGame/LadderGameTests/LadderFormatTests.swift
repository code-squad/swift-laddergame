//
//  LadderFormatTests.swift
//  LadderGameTests
//
//  Created by 이동영 on 22/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderFormatTests: XCTestCase {
    var players:[LadderPlayer] = [LadderPlayer]()
    var height :Int?
    
    override func setUp() {
        do{
            players.append(try LadderPlayer.init(name: "Java"))
            players.append(try LadderPlayer.init(name: "Swift"))
            players.append(try LadderPlayer.init(name: "C++"))
            height = 10
        }catch{
            ()
        }
    }
    
    
    
    
}
