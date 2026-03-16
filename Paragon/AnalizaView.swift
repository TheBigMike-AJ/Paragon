import SwiftUI

// To może być w nowym pliku AnalizaView.swift
struct AnalizaView: View {
    var body: some View {
        VStack {
            Text("Tu w przyszłości będą wykresy roczne i miesięczne.")
                .foregroundColor(.gray)
            
            Spacer()
        }
        .padding()
        // Tytuł dla tego konkretnego ekranu (pojawi się na górnym pasku)
        .navigationTitle("Analiza Wydatków")
    }
}

#Preview {
    AnalizaView()
}
