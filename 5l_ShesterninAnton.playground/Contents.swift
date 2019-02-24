//  1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.

//  2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).

//  3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.

//  4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.

//  5. Создать несколько объектов каждого класса. Применить к ним различные действия.

//  6. Вывести сами объекты в консоль.
enum Windows {
    case opened
    case closed
}
enum Motor {
    case started
    case stoped
}
protocol Car {
    var mark: String {get set}
    var color: String {get set}
    var windowsState: Windows {get set}
    var motorState: Motor {get set}
    func switchDoor()
    func switchMotor()
}

extension Car {
    mutating func switchWindows() {
        if windowsState == .closed {
            windowsState = .opened
        }
        else {
            windowsState = .closed
        }
    }
}
extension Car {
    mutating func switchMotor() {
        if motorState == .stoped {
            motorState = .started
        }
        else {
            motorState = .stoped
        }
    }
}

class TrunkCar: Car {
    func switchMotor() {}
    func switchDoor() {}
    
    var mark: String
    var color: String
    var windowsState: Windows
    var motorState: Motor
    var cargoWeight: Int
    
    init(mark: String, color: String, windowsState: Windows, motorState: Motor, cargoWeight: Int){
        self.mark = mark
        self.color = color
        self.windowsState = windowsState
        self.motorState = motorState
        self.cargoWeight = cargoWeight
    }
}
    
class SportCar: Car {
    func switchMotor() {}
    func switchDoor() {}
    
    var mark: String
    var color: String
    var windowsState: Windows
    var motorState: Motor
    var maxSpeed: Int
    
    init(mark: String, color: String, windowsState: Windows, motorState: Motor, maxSpeed: Int) {
        self.mark = mark
        self.color = color
        self.windowsState = windowsState
        self.motorState = motorState
        self.maxSpeed = maxSpeed
    }
}

var trunk1 = TrunkCar(mark: "Volvo", color: "White", windowsState: .closed, motorState: .stoped, cargoWeight: 500)
trunk1.switchWindows()
trunk1.switchMotor()
print(trunk1.windowsState, trunk1.motorState)

var trunk2 = TrunkCar(mark: "MAN", color: "Gray", windowsState: .opened, motorState: .stoped, cargoWeight: 600)
trunk2.switchMotor()
trunk2.switchWindows()
print(trunk2.windowsState, trunk2.motorState)

var sport1 = SportCar(mark: "Toyota", color: "Red", windowsState: .closed, motorState: .stoped, maxSpeed: 350)
sport1.switchWindows()
sport1.switchMotor()
print(sport1.windowsState, sport1.motorState)

