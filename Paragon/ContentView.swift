import SwiftUI
import PhotosUI
import Charts

struct ContentView: View {
    @State private var zdjecieGaleria: PhotosPickerItem?
    @State private var pokazDodaj: Bool = false
    @State private var dodajNazwa: String = ""
    @State private var dodajKategoria: String = ""
    @State private var dodajCena: String = ""
    @State private var dodawanie = dodawanieproduktow()
    var body: some View {
        // 1. Główny kontener nawigacji
        NavigationStack {
            
            ZStack{
                VStack(spacing: 20) {
                    // --- POLE Z WYKRESEM I ANALIZĄ ---
                    VStack(spacing: 15) {
                        ZStack{
                            Chart{
                                ForEach(dodawanie.Testoweprodukty){ stream in
                                    SectorMark(angle: .value("Stream", stream.cena), innerRadius: .ratio(   0.618)).foregroundStyle(by: .value("Stream", stream.kategoria))
                                }
                            }.chartLegend(.hidden)
                                .frame(width: 300, height: 280)
                            Text(dodawanie.sumaWydatkow, format: .currency(code: "PLN")).font(Font.title2.bold())
                        }
                        
                        
                        // Guzik analizy - pzrenosi do inneg okna
                        NavigationLink {
                            AnalizaView()
                        } label: {
                            Label("Analiza", systemImage: "chart.bar")
                                .font(.title2)
                        }
                        .padding() // <- odstepy w srodku
                        .frame(maxWidth: .infinity) // Rozciągnięcie
                        .background(Color.mainFiolet) // 3. Tło
                        .foregroundStyle(.white) // Kolor tekstu i ikony
                        .cornerRadius(1000) // Zaokrąglenie w pigułkę
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Ostatnie paragony:")
                            .padding()
                            .frame(maxWidth: 200, maxHeight: 1) // Poprawiona kolejność!
                            .foregroundStyle(.tekst)
                            .font(Font.title3)
                        Spacer()
                    }
                    
                    Spacer()
                    
                    
                    // --- POLE Z GUZIKAMI (APARAT I GALERIA) ---
                    VStack{
                        
                        // Guzik aparatu
                        Button {
                            print("Otwieram aparat")
                        } label: {
                            Label("Aparat", systemImage: "camera.viewfinder")
                                .font(.title3)
                        }
                        .padding()
                        .frame(maxWidth: 340)
                        .background(Color.mainFiolet)
                        .foregroundStyle(.white)
                        .cornerRadius(1000)
                        
                        
                        HStack(spacing: 15) {
                            
                            // Guzik galerii
                            PhotosPicker(selection: $zdjecieGaleria, matching: .images) {
                                Label("Galeria",systemImage: "photo.stack")
                                    .font(.title3)
                            }
                            .padding()
                            .frame(maxWidth: .infinity) // Poprawiona kolejność!
                            .background(Color.mainFiolet)
                            .foregroundStyle(.white)
                            .cornerRadius(1000)
                            
                            
                            // Guzik dodania z palca
                            Button {
                                withAnimation {
                                    pokazDodaj = true
                                }
                            } label: {
                                Label("Wpisz", systemImage: "pencil")
                                    .font(.title3)
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.mainFiolet)
                            .foregroundStyle(.white)
                            .cornerRadius(1000)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }.padding(.horizontal)
                    
                }
                .background(Color.tlo)
                .navigationTitle("Nazwa aplikacji lol")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            print("Ustawienia otwarte")
                        } label: {
                            Image(systemName: "gearshape.fill")
                                .foregroundStyle(.black)
                        }
                    }
                }
                if(pokazDodaj == true){
                    Color.black.opacity(0.4).ignoresSafeArea()
                        VStack{
                            HStack{
                                Text("Dodaj produkty").font(Font.title.bold()).padding()
                                Button
                                {
                                    withAnimation {
                                        pokazDodaj = false
                                    }
                                } label: {
                                    Label("", systemImage: "xmark")
                                        .font(.title3)
                                }
                                .frame(maxWidth: 50, maxHeight: 50)
                                .background(Color.mainFiolet)
                                .foregroundStyle(.white)
                                .cornerRadius(10000)
                            }
                            
                            VStack{
                                TextField("Nazwa produktu", text: $dodajNazwa)
                                TextField("Cena produktu", text: $dodajCena).keyboardType(.decimalPad)
                                TextField("Kategoria produktu", text: $dodajKategoria)
                                
                                Button{
                                    if(dodajKategoria == ""){
                                        dodajKategoria = "Inne"
                                    }
                                    if(dodajCena != "" && dodajNazwa != ""){
                                        let czyszczenie = dodajCena .replacingOccurrences(of: ",", with: ".")
                                        let doublecena = Double(czyszczenie) ?? 0.00
                                        let nowyProdukt = Produkt( nazwa: dodajNazwa, cena: doublecena, kategoria: dodajKategoria)
                                        print(nowyProdukt)
                                        dodawanie.Testoweprodukty.append(nowyProdukt)
                                        dodajCena = ""
                                        dodajNazwa = ""
                                        dodajKategoria = ""
                                    }
                                    
                                    
                                    
                                } label: {
                                    Label("Dodaj", systemImage: "plus")
                                        .padding()
                                        .frame(maxWidth: 340)
                                        .background(Color.mainFiolet)
                                        .foregroundStyle(.white)
                                        .cornerRadius(1000)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                                
                            }.textFieldStyle(.roundedBorder)
                                .padding()
                            
                            
                            
                            Spacer()
                        }.frame(maxWidth: .infinity, maxHeight: .infinity)
                         .background(Color.tlo)
                         .cornerRadius(30)
                         .padding(60)
                         .shadow(radius: 10)
                         .transition(.scale)
                }
            }///koniec z
        }
    }
}

#Preview {
    ContentView()
}
