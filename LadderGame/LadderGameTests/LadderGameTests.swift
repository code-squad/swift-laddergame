//
//  LadderGameTests.swift
//  LadderGameTests
//
//  Created by 김성현 on 15/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import XCTest

class LadderGameTests: XCTestCase {
    
    func testRungsNotPlacedInSuccession() {
        
        // When
        let ladder = try! Ladder(numberOfPlayers: 10, height: 10)
        
        // Then
        for row in ladder.info {
            var rungSuccessionCount = 0
            for item in row {
                if item == Ladder.Component.rung {
                    rungSuccessionCount += 1
                } else {
                    rungSuccessionCount = 0
                }
                XCTAssertTrue(rungSuccessionCount < 2)
            }
        }
        
    }
    
    func testPlayerNameTextAlignedToCenter() {
        
        let nameOfPlayers = ["apple", "google", "microsoft", "samsung"]
        
        // When
        let alignedNames = nameOfPlayers.map { $0.alignedToCenter(length: 10) }
        
        // Then
        XCTAssertEqual(alignedNames[0], "  apple   ")
        XCTAssertEqual(alignedNames[1], "  google  ")
        XCTAssertEqual(alignedNames[2], "microsoft ")
        XCTAssertEqual(alignedNames[3], " samsung  ")
        
        
    }
    
    func testLadderPrinting() {
        // Given
        let ladderRow = [
            Ladder.Component.empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .rung,
            .empty,
            .empty
        ]
        
        // When
        let printedRow = ladderRow.stringized(maxNameLength: 1)
        
        // Then
        XCTAssertEqual(printedRow, " |-| |-| |-| |-| | ")
    }
    
    func testInvalidNumberOfPlayers() {
        
        let height = 1
        
        XCTAssertThrowsError(try Ladder(numberOfPlayers: -5, height: height))
        XCTAssertThrowsError(try Ladder(numberOfPlayers: 0, height: height))
        XCTAssertThrowsError(try Ladder(numberOfPlayers: 1, height: height))
        
        
    }
    
    func testInvalidLadderHeight() {
        
        let numberOfPlayers = 2
        
        XCTAssertThrowsError(try Ladder(numberOfPlayers: numberOfPlayers, height: 0))
        XCTAssertThrowsError(try Ladder(numberOfPlayers: numberOfPlayers, height: -1))
        XCTAssertThrowsError(try Ladder(numberOfPlayers: numberOfPlayers, height: -5))

        
    }
    
    func testLadderGameResult() {
        // Given
        let players = [
            Player(name: "player1"),
            Player(name: "player2"),
            Player(name: "player3"),
            Player(name: "player4"),
            Player(name: "player5"),
            Player(name: "player6")
        ]
        let info: [[Ladder.Component]] = [
            [.empty, .rung, .empty, .rung, .empty, .empty, .empty],
            [.empty, .empty, .rung, .empty, .rung, .empty, .empty],
            [.empty, .rung, .empty, .empty, .rung, .empty, .empty],
            [.empty, .rung, .empty, .rung, .empty, .rung, .empty]
        ]
        let ladderGame = try! LadderGame(players: players, height: 4)
        
        // When
        let gameResults = ladderGame.results(ladderInfo: info, players: players)
        
        // Then
        let results = [
            Player(name: "player2"),
            Player(name: "player4"),
            Player(name: "player3"),
            Player(name: "player1"),
            Player(name: "player6"),
            Player(name: "player5")
        ]
        XCTAssertEqual(gameResults.map { $0.name }, results.map { $0.name })
        
    }
    
}
