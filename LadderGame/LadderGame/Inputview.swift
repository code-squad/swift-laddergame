import Foundation

struct Inputview {
    private var playerNames = [LadderPlayer]()
    private var ladderHeight = 0
    
    mutating func readNames()throws -> [LadderPlayer] {
        ask(.nameOfPlayer)
        try checkNumberOfPlayer()
        try checkNameLengthOfPlayer()
        return playerNames
    }
    
    private func ask(_ massage:Massage) {
        print(massage.rawValue)
    }
    
    private mutating func checkNumberOfPlayer()throws{
        let userInput = requestInput()
        let convertedString = try removerOptionalToString(userInput)
        separateName(convertedString)
        try self.isOverOne(playerNames.count)
    }
    
    private mutating func separateName(_ convertedString:String){
        let names = convertedString.components(separatedBy: ",")
        for name in names {
            playerNames.append(LadderPlayer(name: String(name)))
        }
    }
    
    private func removerOptionalToString(_ optionalString:String?)throws -> String{
        if let convertedString = optionalString{
            return convertedString
        }
        throw InputError.isNotString
        
    }
    
    private func requestInput()->String?{
        let userInput = readLine()
        return userInput
    }
    
    private func isOverOne(_ pram:Int)throws{
        guard pram > 1 else {
            throw InputError.isLessThanOne
        }
    }
    
    private func checkNameLengthOfPlayer()throws{
        let maximumplayerNameLength = self.findMaximumPlayerNameLength
        try self.isLessThanFive(maximumplayerNameLength)
    }
    
    private func isLessThanFive(_ MaximumPlayerNameLength:Int)throws{
        guard MaximumPlayerNameLength < 6 else{
            throw InputError.isMoreThanSix
        }
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
    
    mutating func readLadderHeight()throws -> Int {
        try checkNumberOfHeight()
        return ladderHeight
    }
    
    private mutating func checkNumberOfHeight()throws{
        ask(.numberOfHeight)
        let userInput = requestInput()
        let convertedString = try removerOptionalToString(userInput)
        ladderHeight = Int(convertedString) ?? 0
        if ladderHeight == 0 {
            throw InputError.isNotInt
        }
        try self.isOverOne(ladderHeight)
    }
}
