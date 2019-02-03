import Cocoa

//      1. Решить квадратное уравнение.

let Uravnenie = "(x^2)-2x-3=0"
let a: Int = 1
let b: Int = -2
let c: Int = -3
let Discr = (b*b)-(4*a*c)   // Дискриминант


if Discr > 0 {
    let sqrtDiscr = sqrt((Double)(b*b)-(Double)(4*a*c)) // Чтобы не засорять формулу, вынес квадратный корень дискриминанта
    let xOne = ((Double)(-1*b)+sqrtDiscr)/((Double)(2*a))
    let xTwo = ((Double)(-1*b)-sqrtDiscr)/((Double)(2*a))
    print("Уравнение имеет 2 корня, равные: \(xOne), \(xTwo)")
}
else if Discr == 0 {
    let sqrtDiscr = sqrt((Double)(b*b)-(Double)(4*a*c)) // Чтобы не засорять формулу, вынес квадратный корень дискриминанта
    let xOne = ((Double)(-1*b)+sqrtDiscr)/((Double)(2*a))
    print("Уравнение имеет 1 корень, равный: \(xOne)")
}
else {
    print("Отрицательный дискриминант, невозможно вычислить корни")
}



//      2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

let kOne = 3
let kTwo = 4
let S = Double(kOne*kTwo)/Double(2)
let hip = sqrt(Double(kOne*kOne)+Double(kTwo*kTwo))
let P = Double(kOne)+Double(kTwo)+Double(hip)
print("Площадь треугольника: \(S), периметр: \(P), гипотенуза: \(hip)")


//      3. Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

var startMoney : Float = 1000                       // сумма первоначального вклада
let percentPerYear : Float = 10                     // годовой процент
var years = 1
while years <= 5 {
    let onePercent = startMoney / 100               // один процент текущего вклада
    let oneYearBonus = onePercent*percentPerYear    // прирост средств за год
    startMoney = startMoney + oneYearBonus          // вклад через год
    years += 1
}
print("Сумма вклада через 5 лет: \(startMoney)")
