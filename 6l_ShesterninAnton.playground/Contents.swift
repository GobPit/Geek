/*  1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу. */

protocol HasPassengers {
    var passengers: Int {get set}
}


class Car: HasPassengers {
    var maxSpeed: Int
    var passengers: Int
    
    init(maxSpeed: Int, passengers: Int) {
        self.maxSpeed = maxSpeed
        self.passengers = passengers
    }
}
class Bus: HasPassengers {
    var mass: Int
    var passengers: Int
    
    init(mass: Int, passengers: Int) {
        self.mass = mass
        self.passengers = passengers
    }
}

struct Queue<T: HasPassengers> {
    var cars: [T] = []
    mutating func addVehicle (_ car: T) {
        cars.append(car)
    }
    mutating func removeVehicle() -> T? {
        return  cars.removeLast()
    }
    
    var peopleTotal: Int {
        var passengers = 0
        for car in cars {
            passengers += car.passengers
        }
        return passengers
    }
    
    subscript(cars: Int ...) -> Int {
        var passengers = 0
        for index in cars where index < self.cars.count {
            passengers += self.cars[index].passengers
        }
        return passengers
    }
}
var queueBus = Queue<Bus>()
var queueCar = Queue<Car>()

queueBus.addVehicle(Bus(mass: 3000, passengers: 19))
queueBus.addVehicle(Bus(mass: 3500, passengers: 11))
queueBus.addVehicle(Bus(mass: 3900, passengers: 17))
queueCar.addVehicle(Car(maxSpeed: 160, passengers: 5))
queueCar.addVehicle(Car(maxSpeed: 350, passengers: 2))
queueCar.addVehicle(Car(maxSpeed: 100, passengers: 8))

print(queueBus.cars.filter { (cars) -> Bool in
    return cars.passengers > 17
})
print(queueCar.cars.map{$0.maxSpeed})
print(queueBus.cars.sorted(by: {$0.mass < $1.mass}).map{$0.mass})
print(queueBus[1,2])
