//
//  main.swift
//  laddergame01
//
//  Created by 이희찬 on 10/04/2019.
//  Copyright © 2019 이희찬. All rights reserved.
//

import Foundation

let humNum = 10, ladderNum = 16, hight = 5
//만들 배열의 가로길이 계산
func len (humNum:Int)->Int{
    let len = ((humNum-1) * 2) + 1
    return len
}
//이차원 빈배열을 만든다
func emptyladderArr(len:Int, hight:Int)->[[Character]]{
    let ladderArr : [[Character]] = Array(repeating: Array(repeating: " ",count:len ), count: hight)
    return ladderArr
}
//"ㅣ"문자를 배열에 저장
func addHight (humNum:Int,hight:Int,ladderArr:[[Character]])->[[Character]]{
    var ladderArr = ladderArr
    for i in 0..<humNum{
        for j in 0..<hight{
            ladderArr[j][i*2] = "ㅣ"
        }
    }
    return ladderArr
}
//무작위 y좌표(세로) 구하는 함수
func ranHight (hight:Int)->Int{
    let ranHight = Int(arc4random_uniform(UInt32(hight)))
    return ranHight
}
//무작위 x좌표(가로) 구하는 함수
func ranWidth (humNum:Int)->Int{
    let ranWidth = (Int(arc4random_uniform(UInt32(humNum-1))) * 2) + 1
    return ranWidth
}
//"-"문자를 입력받은 개수 만큼 무작위로 배열에 저장
func addWidth (ladderNum:Int,hight:Int,humNum:Int,ladderArr:[[Character]])->[[Character]]{
    var index = 0
    var ladderArr = ladderArr
    while index < ladderNum{
        let hightCoordinate = Int(arc4random_uniform(UInt32(hight)))
        let widthCoordinate = (Int(arc4random_uniform(UInt32(humNum-1))) * 2) + 1
        guard ladderArr[hightCoordinate][widthCoordinate] == " " else{
            continue
        }
        ladderArr[hightCoordinate][widthCoordinate] = "-"
        index += 1
    }
    return ladderArr
}
//이쁘게 출력
func resultprint (ladderArr:[[Character]]){
    for i in ladderArr{
        print(String(i))
    }
}

//실행
let lenValue = len(humNum:humNum)
var ladderArr = emptyladderArr(len:lenValue, hight:hight)
ladderArr = addHight(humNum:humNum,hight:hight,ladderArr:ladderArr)
ladderArr = addWidth(ladderNum:ladderNum,hight:hight,humNum:humNum,ladderArr:ladderArr)
resultprint(ladderArr: ladderArr)
