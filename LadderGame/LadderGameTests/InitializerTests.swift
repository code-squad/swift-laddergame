//
//  InitializerTests.swift
//  LadderGameTests
//
//  Created by 이동영 on 19/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class InitializerTests: XCTestCase {
    
    func testLessNameLength(){
        let name = ""
        XCTAssertThrowsError(try LadderPlayer.init(name: name),"이름 미입력시 에러 발생 성공")
    }
    func testLongerNameLength(){
        let name = "123456"
        XCTAssertThrowsError(try LadderPlayer.init(name: name),"이름길이 초과시 에러 발생 성공")
    }
    func testPlayerNameNomalization(){
        let name = "Swift"
        do{
            let player = try LadderPlayer.init(name: name)
            XCTAssertNotEqual(player.getName(), name,"6글자이하의 이름으로 생성시 정규화합니다.")
        }catch{
            
        }
    }
    
    
}
