//import Foundation
//
//struct test {
//    func check()->Int{
//        let userInput = UserInputManage()
//        while true {
//            let optionalString = userInput.requestNumber
//            if userInput.removeOptional(optionalString) == " " {
//                print("값을 입력하세요")
//                continue
//            }
//            let convertedString = userInput.removeOptional(optionalString)
//            if userInput.convertInt(convertedString) == 0 {
//                print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
//                continue
//            }
//            return userInput.convertInt(convertedString)
//        }
//    }
//}
//
//struct test2 {
//    func isString()->String{
//        let userInput = UserInputManage()
//        let optionalString = userInput.requestNumber
//        let convertedString = userInput.removeOptional(optionalString)
//        if convertedString == " " {
//            print("값을 입력하세요")
//            return isString()
//        }
//        return convertedString
//    }
//    func isInt (_ convertedString:String)->Int{
//        let userInput = UserInputManage()
//        let convertedInt = userInput.convertInt(convertedString)
//        if convertedInt == 0 {
//            print("입력한 값을 다시 확인하세요, 정수를 입력해야 합니다")
//            return isInt(isString())
//        }
//        return convertedInt
//    }
//    func overOne(_ convertedInt:Int)->Int{
//        guard convertedInt > 1 else {
//            return 0
//        }
//        return convertedInt
//    }
//    func playerNumberCheck(_ overOne:Int)->Int{
//        if overOne == 0 {
//            print("최소 플레이어수는 2명 입니다")
//            return isInt(isString())
//        }
//        return overOne
//    }
//    func ladderHeightCheck(_ overOne:Int)->Int{
//        if overOne == 0 {
//            print("최소 사다리 높이는 2 입니다")
//            return isInt(isString())
//        }
//        return overOne
//    }
//    func userInputNumber()->Int{
//        let convertedString = isString()
//        let convertedInt = isInt(convertedString)
//        return convertedInt
//    }
//    func LadderGameBasicValueInitMamber()->Array<Int>{
//        let playerNumber = playerNumberCheck(userInputNumber())
//        let ladderHeight = ladderHeightCheck(userInputNumber())
//        return [playerNumber,ladderHeight]
//    }
//}
