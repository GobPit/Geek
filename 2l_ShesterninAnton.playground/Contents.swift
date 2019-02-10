

//  1. Написать функцию, которая определяет, четное число или нет.

func func1 (a: Int) {
    _ = a%2==0 ? print("Число \(a) - четное") : print("Число \(a) - нечетное")
}
func1 (a: 15)


//  2. Написать функцию, которая определяет, делится ли число без остатка на 3.

func func2 (a: Int) {
   _ = a%3==0 ? print("Число \(a) делится на 3 без остатка") : print("Число \(a) не делится на 3 без остатка")
}
func2 (a: 14)


//  3. Создать возрастающий массив из 100 чисел.

var array1 = Array(0...99)
print(array1)


//  4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for arrElem in array1 {
        if arrElem % 2==0 {
            array1.remove(at: array1.index(of: arrElem)!)
    }
    else if arrElem % 3 != 0{
            array1.remove(at: array1.index(of: arrElem)!)
    }
}
print(array1)


//  5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

func fibo(n: UInt64) -> UInt64 {                  // последовательность Фибоначчи
    var num1: UInt64 = 0
    var num2: UInt64 = 1
    for _ in 0..<n {
        let temp = num1
        num1 = num2
        num2 = temp + num2
    }
    return num1
}

func arrayFibo(n: UInt64) -> [UInt64] {         // добавление в массив n новых чисел Фибоначчи
    var array = [UInt64]()
    for i in 0...n {
        array.append(fibo(n: i))
    }
    return array
}
arrayFibo(n: 92)

// ВОПРОС: почему компилятор ругается при n>92? При использовании типа данных Int - при n>91. Понимаю, что речь идет о больших числах, но, хотелось бы получить развернутый ответ эксперта :). Если причина в разрядности процессора, то у меня i5 (x64)
