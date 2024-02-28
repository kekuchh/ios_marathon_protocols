import Foundation

protocol GameDice {
    var numberDice: Int { get }
}
extension Int: GameDice {
    var numberDice: Int {
        return self
    }
}

let diceCoub = 4
print("There are \(diceCoub.numberDice) on the dice") 
