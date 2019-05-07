import Foundation

struct Inputview {
    private var playerNames = [LadderPlayer]()
    private var ladderHeight = 0
    
    mutating func readNames()->[LadderPlayer] {
        var isCorrectNumber, isCorrectNameLength : Bool
        repeat{
            ask(.nameOfPlayer)
            isCorrectNumber = checkNumberOfPlayer()
            isCorrectNameLength = checkNameLengthOfPlayer()
        }while (isCorrectNumber && isCorrectNameLength) == false
        return playerNames
    }
    
    mutating func readLadderHeight()->Int {
        var isCorrectNumber:Bool
        repeat{
            isCorrectNumber = checkNumberOfHeight()
        }while (isCorrectNumber) == false
        return ladderHeight
    }
    
    private mutating func checkNumberOfPlayer() -> Bool {
        let userInput = requestInput()
        let convertedString = removerOptionalToString(userInput)
        separateName(convertedString)
        let isOverOne = self.isOverOne(playerNumber)
        printErrorMassage(isOverOne,.checkNumberOfPlayer)
        return isOverOne
    }
    
    private func checkNameLengthOfPlayer() -> Bool {
        let maximumplayerNameLength = self.findMaximumPlayerNameLength
        let isLessThanFive = self.isLessThanFive(maximumplayerNameLength)
        printErrorMassage(isLessThanFive,.checkNameLengthOfPlayer)
        return isLessThanFive
    }
    
    private mutating func checkNumberOfHeight() -> Bool {
        ask(.numberOfHeight)
        let userInput = requestInput()
        let convertedString = removerOptionalToString(userInput)
        ladderHeight = Int(convertedString) ?? 0
        let isOverOne = self.isOverOne(ladderHeight)
        printErrorMassage(isOverOne,.checkNumberOfHeight)
        return isOverOne
    }
    
    private func ask(_ massage:Massage) {
        print(massage.rawValue)
    }
    
    private func printErrorMassage(_ isCorrect:Bool, _ errorMassage:ErrorMassage) {
        if isCorrect == false {
            print(errorMassage.rawValue)
        }
    }
    
    private func isOverOne(_ playerNumber:Int)->Bool{
        guard playerNumber > 1 else {
            return false
        }
        return true
    }
    
    private func isLessThanFive(_ MaximumPlayerNameLength:Int) -> Bool {
        guard MaximumPlayerNameLength < 6 else{
            return false
        }
        return true
    }
    
    private var findMaximumPlayerNameLength:Int{
        if let maximumplayerName = playerNameLength.max(){
            return maximumplayerName
        }
        return 0
    }
    
    private var playerNameLength : [Int] {
        var playerNameLength = [Int]()
        for i in playerNames {
            playerNameLength.append(i.name.count)
        }
        return playerNameLength
    }
    
    private func requestInput()->String?{
        let userInput = readLine()
        return userInput
    }
    
    private func removerOptionalToString(_ optionalString:String?) -> String{
        if let convertedString = optionalString{
            return convertedString
        }
        return "fail"
    }
    
    private mutating func separateName(_ convertedString:String){
        let names = convertedString.components(separatedBy: ",")
        for name in names {
            playerNames.append(LadderPlayer(name: String(name)))
        }
    }
}
