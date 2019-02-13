import Cocoa

//  1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

//  2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

// 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

// 6. Вывести значения свойств экземпляров в консоль.

enum engine {
    case start, stop, turboSpeed, ecoDrive
}
enum carColor {
    case red, white, blue, black
}

class Car {
    var color: carColor
    var weight: Int
    var maxSpeed: Int
    var engineMode: engine
    init(color: carColor, weight: Int, maxSpeed: Int, engineMode: engine){
        self.color = color
        self.weight = weight
        self.maxSpeed = maxSpeed
        self.engineMode = engineMode
    }
    func startEngine(start: engine) {
        engineMode = .start
    }
}

class TrunkCar: Car {
    var trunkSpace: Int
    init(color: carColor, weight: Int, maxSpeed: Int, engineMode: engine, trunkSpace: Int) {
        self.trunkSpace = trunkSpace
        super.init(color: color, weight: weight, maxSpeed: maxSpeed, engineMode: engineMode)
    }
    override func startEngine(start: engine) {
        engineMode = .ecoDrive
    }
}

var trunk1 = TrunkCar(color: .black, weight: 150, maxSpeed: 180, engineMode: .start, trunkSpace: 50)
trunk1.startEngine(start: .start)
print("\(trunk1.color) \(trunk1.weight) \(trunk1.maxSpeed) \(trunk1.engineMode) \(trunk1.trunkSpace)")

class SportCar: Car {
    var horsePower: Int
    init(color: carColor, weight: Int, maxSpeed: Int, engineMode: engine, horsePower: Int) {
        self.horsePower = horsePower
        super.init(color: color, weight: weight, maxSpeed: maxSpeed, engineMode: engineMode)
    }
    override func startEngine(start: engine) {
        engineMode = .turboSpeed
    }
}

var sport1 = SportCar(color: .red, weight: 100, maxSpeed: 300, engineMode: .start, horsePower: 500)
sport1.startEngine(start: .start)
print("\(sport1.color) \(sport1.weight) \(sport1.maxSpeed) \(sport1.engineMode) \(sport1.horsePower)")

