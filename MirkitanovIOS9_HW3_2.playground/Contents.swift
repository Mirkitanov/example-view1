import UIKit
print("""

Домашнее задание к занятию 3.2. Протоколы и расширения. Студент группы IOS-9 Миркитанов П.В.


""")

/*
            Часть 1.
     Для начала нужно описать машину минимальным набором параметров, используя протокол.

             Алгоритм выполнения
 1. Создайте протокол 'Car'
 2. Добавьте в него свойства:
 - 'model' (только для чтения): марка
 - 'color' (только для чтения): цвет
 - 'buildDate' (только для чтения): дата выпуска
 - 'price' (чтение и запись): цена авто
 - 'accessories' (чтение и запись): дополнительное оборудование (тонировка, сингнализация, спортивные диски)
 - 'isServiced' (чтение и запись): сделана ли предпродажная подготовка. Обычно ее делают в дилерских центрах перед постановкой машины в салон.
 */

protocol CarProtocol {
    var model: String {get}                 // (только для чтения): марка
    var color: String {get}                 // (только для чтения): цвет
    var buildDate: String {get}             // (только для чтения): дата выпуска
    var price: Double {get set}             // (чтение и запись): цена авто
    var accessories: [String] {get set}     // (чтение и запись): дополнительное оборудование (тонировка, сингнализация, спортивные диски)
    var isServiced: Bool {get set}          // (чтение и запись): сделана ли предпродажная подготовка. Обычно ее делают в дилерских центрах перед постановкой машины в салон.
}

print ("Протокол Car был успешно создан и проименован как 'protocol CarProtocol'\n")

/*

            Часть 2.
По аналогии с протоколом 'Car', нужно описать дилерский центр минимальным набором свойств и методов, используя протокол.

            Алгоритм выполнения
Создайте протокол 'Dealership'
Добавьте свойства:
'name' (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
'showroomCapacity' (только для чтения): максимальная вместимость автосалона по количеству машин.
'stockCars' (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
'showroomCars' (массив, чтение и запись): машины, находящиеся в автосалоне.
'cars' (массив, чтение и запись): хранит список всех машин в наличии.
Добавьте методы:
'offerAccesories(_ :)': принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
'presaleService(_ :)': принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
'addToShowroom(_ :)': также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
'sellCar(_ :)': также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
'orderCar()': не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
*/

protocol DealershipProtocol {
    var name: String {get} //: (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
    var showroomCapacity: Int {get} //: (только для чтения): максимальная вместимость автосалона по количеству машин.
    var stockCars: [Car] {get set} //: (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
    var showroomCars: [Car] {get set} //: (массив, чтение и запись): машины, находящиеся в автосалоне.
    //var cars: [Car] {get set} //: (массив, чтение и запись): хранит список всех машин в наличии.
// методы:
    func offerAccesories(_ : [String]) //: принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
    func presaleService(_ : Car) //: принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
    func addToShowroom(_ : Car) //: также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
    func sellCar(_ : Car)//: также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
    func orderCar()//: не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
}
print ("Протокол Dealership был успешно создан и проименован как 'protocol DealershipProtocol'\n")

/*
Часть 3.
Настало время добавить классы и структуры, реализующие созданные ранее протоколы.

Алгоритм выполнения
Используя структуры, создайте несколько машин разных марок (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Car'.
Используя классы, создайте пять различных дилерских центров (например BMW, Honda, Audi, Lexus, Volvo). Все они должны реализовать протокол 'Dealership'. Каждому дилерскому центру добавьте машин на парковку и в автосалон (используйте те машины, которые создали ранее).
Создайте массив, положите в него созданные дилерские центры. Пройдитесь по нему циклом и выведите в консоль слоган для каждого дилеского центра (слоган можно загуглить).
 */


protocol DealershipDataSource: AnyObject { // Объявляем протокол для Данных
    
    var cars: [Car] {get set}
    
}

class CarFactory: DealershipDataSource {
    
    var cars: [Car] = []
    
    func numberOfCars ()-> Int {
        return cars.count
    }
    
    func carForIndex (index: Int) -> Car {
        return cars [index]
    }
}

class Car: CarProtocol {
    
    var model: String
    
    var color: String
    
    var buildDate: String
    
    var price: Double
    
    var accessories: [String] = []
    
    var isServiced: Bool = false
    
    
    init(model: String, color: String, buildDate: String, price: Double) {
        
        self.model = model
        
        self.color = color
        
        self.buildDate = buildDate
        
        self.price = price
    }
}

extension Car: CustomStringConvertible{       //: Объявляем расширение для более удобного вывода информации о машине
    
    var description: String {
        
        var servicedString: String = ""
        
        if self.isServiced {
            servicedString = "сделано"
        } else {
            servicedString = "не сделано"
        }
        
        var noneAccessoriesString: String = ""
        
        if accessories.isEmpty {
            noneAccessoriesString = "нет"
        }
        
        return "Машина: '\(self.model)', Цвет: \(self.color), Год выпуска: \(self.buildDate), Предпродажная подготовка: \(servicedString), Доп.оборудование: \(noneAccessoriesString)\(self.accessories), Цена (руб.): \(self.price)"
    }
}

class Dealership: DealershipProtocol {

    // var cars: [Car]
    
    var name: String//: (только для чтения): название дилерского центра (назвать по марке машины для упрощения)
    
    var showroomCapacity: Int //: (только для чтения): максимальная вместимость автосалона по количеству машин.
    
    var stockCars: [Car] = [] //: (массив, чтение и запись): машины, находящиеся на парковке склада. Представим, что парковка не имеет лимита по количеству машин.
    
    var showroomCars: [Car] = [Car] ()//: (массив, чтение и запись): машины, находящиеся в автосалоне.
   
    var cars: [Car] {stockCars + showroomCars}//: (массив, чтение и запись): хранит список всех машин в наличии.
    
    var proposedAccesories: [String] = ["тонировка", "сингнализация", "спортивные диски"] // предложенное доп.оборудование
    
    var choosenAccesories: [String] = ["ничего не выбрано"] // выбранное доп.оборудование
    
    var emptyLotsInShowroom: Int // количество свободных мест в выставочном зале автосалона
    
    var showroomCarIndex: Int = 0 // индекс выбора авто по выставочному залу автосалона
    
    var stockCarIndex: Int = 0 // индекс выбора по парковке автосалона
    
    weak var dataSource: DealershipDataSource? // откуда берем данные (машины)
    
    var slogan: String = "" // слоган
    
    init(name: String, showroomCapacity: Int) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        emptyLotsInShowroom = showroomCapacity
    }
    
    func offerAccesories(_ accesories: [String]) {//: принимает массив акксесуаров в качестве параметра. Метод предлагает клиенту купить доп. оборудование.
        
        if accesories != proposedAccesories {
            print("\nПредлагаем Вам добавить дополнительное оборудование: \(proposedAccesories)")
            print ("\nВыберите пожалуйста необходимое дополнительное оборудование\n")
            choosenAccesories = proposedAccesories
            print("В комплект добавлено дополнительное оборудование: \(choosenAccesories)\n")
            
        } else {
            
            print ("Дополнительное оборудование уже установлено")
            
        }
    }
    
    func presaleService(_ carService: Car) {//: принимает машину в качестве параметра. Метод отправляет машину на предпродажную подготовку.
        
        print("""
            
        Машина принята в обработку:
            
\(carService)

        Машина отправлена на предпродажную подготовку
            
""")
        
    }
    
    func addToShowroom(_ addCar: Car) {//: также принимает машину в качестве параметра. Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку.
        
        if self.emptyLotsInShowroom == 0 {
            
            print ("\nВ выставочном зале автосалона \(self.name) нет свободных мест!\n")
            
            return
            
        } else {
        
        var isFindNeedCarToTheStock = false
        
        self.stockCarIndex = 0
        
        for (index, needCar) in self.stockCars.enumerated() {
            if needCar.description == addCar.description {
                self.stockCarIndex = index
                isFindNeedCarToTheStock = true
                break
            }
        }
        
        if isFindNeedCarToTheStock {
            
            //Уменьшение машин на парковке
            let findCar = self.stockCars.remove(at: self.stockCarIndex)
            
            presaleService(findCar)
            
            addCar.isServiced = true

            // Увеличение машин в салоне
            self.showroomCars.append(findCar)
            
            self.emptyLotsInShowroom -= 1
            
            print ("""
        Предпродажная подготовка машины выполнена
            
\(addCar)
            
        Машина перемещена с парковки складв в выставочный зал автосалона
            
""")
        } else {
            print ("Нужная машина не найдена на парковке")
        }
    }
}
    
    func sellCar(_ car: Car) {//: также принимает машину в качестве параметра. Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка. Также, если у машины отсутсвует доп. оборудование, нужно предложить клиенту его купить. (давайте представим, что клиент всегда соглашается и покупает :) )
       
        if car.accessories != choosenAccesories{
            offerAccesories(car.accessories)
            print ("Вы согласны приобрести следующее доп. оборудование: \(choosenAccesories)\n")
            print ("        Да!\n")
            print ("Отлично! Стоимость доп. обороудование будет добавлена в цену машины\n")
            car.accessories = choosenAccesories
            car.price = car.price + 5000 + 7000 + 20000
        }
   
    print ("""
        Машина готова к продаже

\(car)
        
        Вам необходимо оплатить: \(car.price)

        
        Спасибо за покупку!

""")
        
   // Уменьшение машин в салоне
        self.showroomCars.remove(at: showroomCarIndex)
    }
    
    func addCarToStockFromFactory (carFromFactory: Car){ // Исходная функция, которая просто довабляет машину с Завода на парковку склада
            self.stockCars.append(carFromFactory)
            print ("На парковку склада \(self.name) добавлена:\n\(carFromFactory)\n")
    }
    
    
    func orderCar() {//: не принимает и не возвращает параметры. Метод делает заказ новой машины с завода, т.е. добавляет машину на парковку склада.
    
        guard let dataSource = dataSource else {
                return
        }
            for oneCar in dataSource.cars{
              addCarToStockFromFactory(carFromFactory: oneCar)
            }
    }
    
    func chooseNumberOfCarInShowroomForSale (by index: Int){ //Выбираем машину для продажи согласно порядковому номеру в списке выставочного зала
        
        if showroomCars.isEmpty {
            print("К сожалению, в выставочном зале нет ни одной готовой к продаже машины. Обратитесь пожалуйста к менеджеру")
            return
        }
        
            if (index > 0) && (index <= showroomCars.count) {
            print("\n       Вы выбрали машину под порядковым номером №\(index) в выставочном зале автосалона \(self.name): \n\(showroomCars [index - 1 ])\n")
            self.showroomCarIndex = index - 1
            } else {
                print("Указанного порядкового номера \(index) в спике машин выставочного зала нет. Уточните пожалуйста порядковый номер интересующей Вас машины ")
                return
            }
        
        sellCar(showroomCars[self.showroomCarIndex])
    }
    
    func viewDealershipCars (){                                   // Просмотр содержимого Дилерского центра
        print("------------------------------------------------------")
        print("\n\tАтосалон: \(self.name)\n")
        print(".......................................................")
        print("Машины на парковке склада (количество '\(stockCars.count)' шт.) >>>\n")
        for (index, car) in self.stockCars.enumerated(){
            print("№\(index+1). \(car)")
        }
        print(".......................................................")
        print("Машины в выставочном зале, готовые к продаже (количество '\(showroomCars.count)' шт.) >>>\n")
        for (index, car) in self.showroomCars.enumerated(){
            print("№\(index+1). \(car)")
        }
        print(".......................................................")
        
        print ("\nОбщее количество автомобилей салона \(self.name) = \(self.cars.count) шт.")
        print("------------------------------------------------------")
    }
}

class BMW: Car {
    let firm: String = "BMW"
}

class Audi: Car {
    let firm: String = "Audi"
}

class Honda: Car {
    let firm: String = "Honda"
}

class Lexus: Car {
    let firm: String = "Lexus"
}

class Volvo: Car {
    let firm: String = "Volvo"
}


class DealershipBMW: Dealership{
    override func addCarToStockFromFactory(carFromFactory: Car) {
       if let thisCar = carFromFactory as? BMW{
            super.addCarToStockFromFactory(carFromFactory: thisCar)
        }
    }
}

class DealershipHonda: Dealership{
    override func addCarToStockFromFactory(carFromFactory: Car) {
       if let thisCar = carFromFactory as? Honda{
            super.addCarToStockFromFactory(carFromFactory: thisCar)
        }
        
    }
}

class DealershipAudi: Dealership{
    override func addCarToStockFromFactory(carFromFactory: Car) {
       if let thisCar = carFromFactory as? Audi{
            super.addCarToStockFromFactory(carFromFactory: thisCar)
        }
    }
}

class DealershipLexus: Dealership{
    override func addCarToStockFromFactory(carFromFactory: Car) {
       if let thisCar = carFromFactory as? Lexus{
        super.addCarToStockFromFactory(carFromFactory: thisCar)
        }
    }
}

class DealershipVolvo: Dealership{
    override func addCarToStockFromFactory(carFromFactory: Car) {
       if let thisCar = carFromFactory as? Volvo{
           super.addCarToStockFromFactory(carFromFactory: thisCar)
        }
    }
}


// Создадим несколько автомобилей

var bmw735 = BMW(model: "BMW - 735", color: "Черный", buildDate: "2017", price: 1500000)
var bmw435 = BMW(model: "BMW - 435", color: "Черный", buildDate: "2016", price: 850000)
var bmw820 = BMW(model: "BMW - 820", color: "Белый", buildDate: "2020", price: 2850000)

var hondaCivic = Honda(model: "Honda Civic", color: "Красный", buildDate: "2020", price: 1050000)
var hondaAccord = Honda(model: "Honda Accord", color: "Синий", buildDate: "2015", price: 1250000)

var audiA4 = Audi(model: "Audi A4", color: "Белый", buildDate: "2020", price: 1650000)
var audiA6 = Audi(model: "Audi A6", color: "Белый", buildDate: "2010", price: 1650000)

var lexusES = Lexus(model: "Lexus ES", color: "Серый", buildDate: "2020", price: 2540000)
var lexusRX = Lexus(model: "Lexus RX", color: "Серый", buildDate: "2020", price: 4550000)
var lexusLX = Lexus(model: "Lexus LX", color: "Серый", buildDate: "2020", price: 7500000)

var volvoXC90 = Volvo(model: "Volvo XC90", color: "Серый", buildDate: "2020", price: 4250000)
var volvoXC60 = Volvo(model: "Volvo XC60", color: "Коричневый", buildDate: "2019", price: 4000000)
var volvoV60 =  Volvo(model: "Volvo v60", color: "Коричневый", buildDate: "2017", price: 3250000)

//Создадим дилерские центры
var dealershipBMW = DealershipBMW(name: "BMW", showroomCapacity: 10)
var dealershipHonda = DealershipHonda(name: "Honda", showroomCapacity: 10)
var dealershipAudi = DealershipAudi(name: "Audi", showroomCapacity: 20)
var dealershipLexus = DealershipLexus(name: "Lexus", showroomCapacity: 15)
var dealershipVolvo = DealershipVolvo(name: "Volvo", showroomCapacity: 12)

// Создадим АвтоЗавод и добавим в него все созданные машины
var factory = CarFactory()
factory.cars.append(bmw435)
factory.cars.append(bmw735)
factory.cars.append(bmw820)
factory.cars.append(hondaCivic)
factory.cars.append(hondaAccord)
factory.cars.append(audiA4)
factory.cars.append(audiA6)
factory.cars.append(lexusES)
factory.cars.append(lexusLX)
factory.cars.append(lexusRX)
factory.cars.append(volvoV60)
factory.cars.append(volvoXC90)
factory.cars.append(volvoXC60)

//Протестируем все методы дилерского ценра на работоспособность

dealershipBMW.dataSource = factory  // Обратимся к заводу как источнику машин
dealershipBMW.orderCar()            // Добавим на парковку склада автосалона BMW только машины BMW
dealershipBMW.viewDealershipCars()  // Смотрим содержимое автосалона

dealershipBMW.addToShowroom(bmw735) // Попробуем переместить машину со склада в выстовочный зал
dealershipBMW.viewDealershipCars()  // Смотрим содержимое автосалона

dealershipBMW.addToShowroom(bmw735) // Повторно попробуем переместить машину со склада в выстовочный зал
dealershipBMW.viewDealershipCars()  // Смотрим содержимое автосалона

dealershipBMW.chooseNumberOfCarInShowroomForSale(by: 1)
dealershipBMW.viewDealershipCars()  // Смотрим содержимое автосалона

// Добавим каждому дилерскому центру машин на парковку и в салон
dealershipBMW.addToShowroom(bmw820)

dealershipAudi.dataSource = factory
dealershipAudi.orderCar()
dealershipAudi.addToShowroom(audiA4)
dealershipAudi.addToShowroom(audiA6)

dealershipHonda.dataSource = factory
dealershipHonda.orderCar()
dealershipHonda.addToShowroom(hondaCivic)

dealershipLexus.dataSource = factory
dealershipLexus.orderCar()
dealershipLexus.addToShowroom(lexusES)
dealershipLexus.addToShowroom(lexusRX)

dealershipVolvo.dataSource = factory
dealershipVolvo.orderCar()
dealershipVolvo.addToShowroom(volvoV60)
dealershipVolvo.addToShowroom(volvoXC60)

//Добавим слоган для каждого дилерского центра
dealershipBMW.slogan = "«С удовольствием за рулём»"
dealershipAudi.slogan = "«Воплощение безупречности»"
dealershipHonda.slogan = "«Сила мечты»"
dealershipLexus.slogan = "«Неудержимое стремление к совершенству»"
dealershipVolvo.slogan = "«Что самое ценное в роскошном автомобиле? Ваша жизнь»"

//Создадим массив и добавим в него все диллерские центры
var allDealershipsList: [Dealership] = []

allDealershipsList.append(dealershipBMW)
allDealershipsList.append(dealershipHonda)
allDealershipsList.append(dealershipAudi)
allDealershipsList.append(dealershipLexus)
allDealershipsList.append(dealershipVolvo)

//пройдемся по массиву циклом и выведем слоган для каждого диллерского центра
print("----------------------------------------------------------------------")
print("\nВыведем в консоль слоган для каждого диллерского центра\n")
for  dealer in allDealershipsList{
    print("Дилерский центр \(dealer.name) имеет слоган \(dealer.slogan)")
}










