//
//  main.swift
//  LadderGame
//
//  Created by JK on 09/10/2017.
//  Copyright © 2017 Codesquad Inc. All rights reserved.
//

import Foundation

typealias LadderFrame = [[Bool]]

/// 사다리 게임을 시작합니다.
func startLadderGame() {
  
  guard let ladderInfo = try? enterUserInput() else {
    return
  }
  
  guard (ladderInfo.person != nil) || (ladderInfo.height != nil) else {
    print("프로그램을 종료합니다.")
    return
  }
  
  let emptyLadder = createEmptyLadderBy(ladderInfo: ladderInfo)
  
  let ladder = buildLadder(ladder: emptyLadder)
  
  draw(ladder: ladder)
  
}

/// `ladderInfo`를 이용해서 빈 사다리를 생성합니다.
/// 빈 사다리는 전부 `false`로 초기화 됩니다.
///
/// - Parameters:
///     - ladderInfo: `person`: 참여자의 수, `height`: 사다리의 높이.
///

func createEmptyLadderBy(ladderInfo: (person: Int?, height: Int?)) -> LadderFrame {
  
  guard let person = ladderInfo.person, let ladderHeight = ladderInfo.height else {
    return [[]]
  }
  
  let ladderWidth = person - 1
  
  let emptyLadder = Array(repeating: Array(repeating: false, count: ladderWidth), count: ladderHeight)
  
  return emptyLadder
}

func buildLadder(ladder: LadderFrame) -> LadderFrame {
  var ladder = ladder
  
  for (floorNum, floor) in ladder.enumerated() {
    for ladderComponent in 0..<floor.count {
      
      ladder[floorNum][ladderComponent] = createStep(ladder: ladder, floor: floorNum, component: ladderComponent)
    }
  }
  return ladder
}

/// 연속되지 않는 유효한 사다리 스텝을 생성합니다.
///
/// 사다리 스텝은 `isRandomStep()`을 통해 랜덤으로 생성됩니다.
///
/// - Parameters:
///   - ladder: 스텝을 만들 사다리.
///   - floor: 사다리의 층.
///   - component: 사다리의 부속품, 선.
func createStep(ladder: LadderFrame, floor: Int, component: Int) -> Bool {
  
  let previousComponent = component - 1
  
  guard component > 0 else {
    return isRandomStep()
  }
  
  if ladder[floor][previousComponent] == true {
    return false
  }
  
  return isRandomStep()
}

func isRandomStep() -> Bool {
  let randomStep = Bool.random()
  return randomStep
}

/// 사다리의 component가 수직선인지 판단합니다.
///
/// - Returns: 수직선이면 true를 반환합니다.
func isVerticalComponent(_ component: Int) -> Bool {
  return component % 2 == 0 ? true : false
}

/// 사다리 데이터를 console에 출력합니다.
func draw(ladder: LadderFrame) {
  for (floorNum, floor) in ladder.enumerated() {
    
    print("|", terminator: "")
    
    for ladderComponent in 0..<floor.count {
      
      ladder[floorNum][ladderComponent] ? print("-", terminator: "|") : print(" ", terminator: "|")
      
    }
    
    print("")
    
  }
}

enum UserInputError: Error {
  case incorrectFormat
  case emptyValue
  case negativeValue
}

extension UserInputError: CustomStringConvertible {
  var description: String {
    switch self {
    case .incorrectFormat: return "정확하지 않은 형식입니다. 0 이상의 정수만 입력해주세요."
    case .emptyValue: return "값이 없습니다."
    case .negativeValue: return "0 이상의 값을 입력해주세요."
    }
  }
}

///사용자의 입력을 받습니다.
func enterUserInput() throws -> (person: Int?, height: Int?) {
  
  var person: Int?
  var height: Int?
  
  do {
    print("참여할 사람은 몇 명인가요? (ex: 3)")
    person = try readUserInput()
    print("최대 사다리의 높이는 무엇인가요? (ex: 5)")
    height = try readUserInput()
  } catch let err as UserInputError {
    print("error: \(err.description)")
  }
  
  return (person, height)
}

/// 사용자의 입력을 읽어옵니다.
///
/// 사용자의 입력을 읽어서 케이스에 따라 error를 던집니다.
func readUserInput() throws -> Int? {
  
  let prompt = readLine()
  
  guard let response = prompt else {
    throw UserInputError.emptyValue
  }
  
  guard let ladderInfo = Int(response.trimmingCharacters(in: CharacterSet.whitespaces)) else {
    throw UserInputError.incorrectFormat
  }
  
  guard ladderInfo > 0 else {
    throw UserInputError.negativeValue
  }
  
  return ladderInfo
}

startLadderGame()

