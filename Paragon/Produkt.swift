import Foundation
import Observation

struct Produkt: Identifiable{
    let id = UUID()
    let nazwa: String
    let cena: Double
    let kategoria: String
}

@Observable
class dodawanieproduktow {
    var Testoweprodukty: [Produkt] = [
        Produkt(nazwa: "Chleb", cena: 4.50, kategoria: "Jedzenie"),
        Produkt(nazwa: "Makaron", cena: 5.20, kategoria: "Jedzenie"),
        Produkt(nazwa: "Pizza", cena: 24.00, kategoria: "Jedzenie"),
        
        Produkt(nazwa: "Woda", cena: 2.50, kategoria: "Picie"),
        Produkt(nazwa: "Cola", cena: 6.00, kategoria: "Picie"),
        
        Produkt(nazwa: "Bilet autobusowy", cena: 3.80, kategoria: "Transport"),
        Produkt(nazwa: "Uber", cena: 18.50, kategoria: "Transport"),
        
        Produkt(nazwa: "Gra na Steam", cena: 59.99, kategoria: "Rozrywka"),
        Produkt(nazwa: "Bilet do kina", cena: 25.00, kategoria: "Rozrywka"),
        
        Produkt(nazwa: "Notes", cena: 8.90, kategoria: "Inne")
    ]
    
    var sumaWydatkow: Double {
            var suma = 0.0
            
            for produkt in Testoweprodukty {
                suma += produkt.cena
            }
            
            return suma
        }

}



