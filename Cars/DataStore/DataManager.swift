import Foundation
import SwiftUI



@Observable
class DataManager {
    var cars: [Car] = []
     
    init() {
        let cars: Cars = load("cars.json")
        self.cars = cars.cars
    }
    
    func getCars() -> [Car] {
        return cars
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func loadCars() async {
       
        
        do {
            print("⏳ Loading car data...")
            try await Task.sleep(for: .seconds(1))
            
            //load cars
            print("✅ Data loaded successfully.")
        } catch {
            print("❌ Failed to load cars:", error)
            cars = []
        }
        
        
    }
    
}
