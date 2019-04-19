//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 이동영 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest


class LadderGameTests: XCTestCase {
    
    func testPlayerNameNomalization(){
        do{
            let player = try LadderPlayer.init(name: "HTML")
            XCTAssertEqual(player.getName().count,6,"이름이 6글자로 규격화 되었습니다.")
        }catch{
            ()
        }
   }
    
    func testGetRandomSteps(){
        let exist = StepType.exist
        
        XCTAssertNotEqual(exist.generateAfter(), StepType.exist, "기존에 발판이 존재하면 빈 발판을 반환하지 않습니다.")
    }
    
  
    
}
