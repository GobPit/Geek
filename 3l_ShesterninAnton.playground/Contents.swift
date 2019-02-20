

import Foundation

//  1. Описать несколько структур – любой легковой автомобиль и любой грузовик.

//  2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.

//  3. Описать перечисления с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

//  4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

//  5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.

//  6. Вывести значения свойств экземпляров в консоль.

enum engine {
    case start, stop
}
enum windows {
    case open, close
}
enum bagazhnik: Int {
    case addHalf = 50, removeHalf = -50, addQuater = 25, removeQuater = -25
}
enum kuzov: Int {
    case addHalf = 50, removeHalf = -50, addQuater = 25, removeQuater = -25
}
struct car {
    let mark: String
    let year: Int
    var bagazhSpace: Int
    var isEngine: Bool
    var isWindows: Bool
    var bagazhLoaded: Int
    mutating func switchEngine() {
        isEngine = !isEngine
    }
}

struct truck {
    let mark: String
    let year: Int
    var kuzovSpace: Int
    var isEngine: Bool
    var isWindows: Bool
    var kuzovLoaded: Int
    mutating func switchWindow () {
        isWindows = !isWindows
    }
    mutating func removeCargo (removed: Int) {      // разгрузка грузовика
        kuzovLoaded = kuzovLoaded - removed
    }
}

var car1 = car(mark: "Nissan", year: 1982, bagazhSpace: 70, isEngine: true, isWindows: true, bagazhLoaded: 50)
var truck1 = truck(mark: "Man", year: 1995, kuzovSpace: 350, isEngine: false, isWindows: true, kuzovLoaded: 200)
car1.switchEngine()
truck1.switchWindow()
truck1.removeCargo(removed: 100)

print("Автомобиль марки \(car1.mark), \(car1.year) года выпуска, объем багажника \(car1.bagazhSpace), включен ли двигатель \(car1.isEngine), открыты ли окна \(car1.isWindows), загружено в машину \(car1.bagazhLoaded)")
print("Грузовик марки \(truck1.mark), \(truck1.year) года выпуска, объем кузова \(truck1.kuzovSpace), включен ли двигатель \(truck1.isEngine), открыты ли окна \(truck1.isWindows), загружено в грузовик \(truck1.kuzovLoaded)")

