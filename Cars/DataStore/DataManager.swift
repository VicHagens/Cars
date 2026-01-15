import Foundation
import SwiftUI


enum SortPreference: String, CaseIterable {
    case price = "Price"
    case brand =  "Brand"
    case year =  "Year"
}


@Observable
class DataManager {
    var SortPreference: SortPreference = .price
    var cars: [Car] = []
    
   
    
    func getCars() -> [Car] {
        return cars
    }
    
    func getCarsBySorting(sorting: String) -> [Car] {
        
        if sorting == "Alle" {
            return FilterCars(arr: cars)
        }
        var arr: [Car] = []
        
        for car in cars {
            if car.fuelType == sorting {
                arr.append(car)
            }
        }
        return FilterCars(arr: arr)
    }
    
    func FilterCars(arr: [Car]) -> [Car] {
        return arr.sorted { car1, car2 in
            switch SortPreference {
            case .price:
                return car1.price < car2.price
            case .brand:
                return car1.brand < car2.brand
            case .year:
                return car1.year < car2.year
            }
        }
    }
    
    func getCarsById(_ ids: [Int]) -> [Car] {
        let idSet = Set(ids)
        var arr: [Car] = []
        
        for car in cars {
            if idSet.contains(car.id){
                arr.append(car)
            }
        }
        
        return arr
    }
    
    private func sort() {
        cars.sort { lhs, rhs in
            lhs.brand.localizedStandardCompare(rhs.brand) == .orderedAscending
        }
    }
    
    func loadCars() async {
       
        
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            let cars: Cars = load("cars.json")
            self.cars = cars.cars
            //load cars
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load cars:", error)
            cars = []
        }
        
        
    }
    
}
