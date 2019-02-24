import Cocoa

//  1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.

enum PartyCalculatorError: Error {
    case notEnoughPeople
    case notEnoughPizza
    case wrongPartyType
}

struct PartyDetails {
    var peopleCame: Int
   // var pizzas: Int
    let size: PartySize
}

struct PartySize {
    var size: String
}

class PartyCalculator {
    var scenarios = [
        "Failed": PartyDetails(peopleCame: 0, size: PartySize(size: "Failed")),
        "Medium": PartyDetails(peopleCame: 21, size: PartySize(size: "Medium")),
        "Asome": PartyDetails(peopleCame: 30, size: PartySize(size: "Asome"))
    ]
    
    func calcParty (partyMode name: String) throws -> PartySize {
        guard let mode = scenarios[name] else {
            throw PartyCalculatorError.wrongPartyType
        }
        var pizzasAtParty = 20
        var newParty = mode
        
        guard mode.peopleCame == 0 || mode.peopleCame < pizzasAtParty else {
            throw PartyCalculatorError.notEnoughPeople
        }
        guard mode.peopleCame > pizzasAtParty else {
            throw PartyCalculatorError.notEnoughPizza
        }
        return (mode.size)
    }
}
let someParty = PartyCalculator()
do {
    let p1 = try someParty.calcParty(partyMode: "Failed")

}
catch PartyCalculatorError.notEnoughPeople {
    print("notEnoughPeople")
}
catch PartyCalculatorError.notEnoughPizza {
    print("notEnoughPizza")
}
catch PartyCalculatorError.wrongPartyType {
    print("wrongPartyType")
}


//  2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.

enum WashingMachineError: Error {
    case wrongProgram
    case tooMuchCloth
    case wrongRotation(rotationNeeded: Int)
}

struct Params {             //параметры режима стирки
    var rotation: Int
    var maxWeight: Int
    let mode: Mode
}

struct Mode {
    let name: String
}

class WashingMachine {
    var programs = [
        "Casual": Params(rotation: 800, maxWeight: 2, mode: Mode(name: "Casual")),
        "Sport gear": Params(rotation: 1000, maxWeight: 4, mode: Mode(name: "Sport gear")),
        "Extra fast": Params(rotation: 1200, maxWeight: 3, mode: Mode(name: "Extra fast"))
    ]
    
    var clothLoaded = 3
    var rotationSelected = 1000
    func wash (choosedParam name: String) -> (Mode?, WashingMachineError?) {
        guard let param = programs[name] else {
            return (nil, WashingMachineError.wrongProgram)
            }
        
        guard param.maxWeight >= clothLoaded else {
            return (nil, WashingMachineError.tooMuchCloth)
        }
        
        guard param.rotation == rotationSelected else {
            return (nil, WashingMachineError.wrongRotation(rotationNeeded: param.rotation))
        }
        print("Washing cloth with \(name) mode")
        
        return (param.mode, nil)
    }
}

let washingMashine = WashingMachine()
let wm1 = washingMashine.wash(choosedParam: "Casual")
let wm2 = washingMashine.wash(choosedParam: "Sport gear")
let wm3 = washingMashine.wash(choosedParam: "Extra fast")
let wm4 = washingMashine.wash(choosedParam: "Boogie")

