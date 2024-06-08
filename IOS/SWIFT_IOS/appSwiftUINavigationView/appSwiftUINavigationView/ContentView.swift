//
//  ContentView.swift
//  appSwiftUINavigationView
//
//  Created by Jorge Cisneros on 07/06/24.
//

import SwiftUI

struct emojiFrutas: Identifiable {
    
    let id = UUID()
    let emoji: String
    let nombre: String
    let descripcion: String
    
}

private let listaEmojis: [emojiFrutas] = [
    emojiFrutas(
        emoji: "🍊",
        nombre: "Naranja",
        descripcion: "La naranja es una fruta cítrica obtenida del naranjo dulce, del naranjo amargo y de naranjos de otras variedades o híbridos, de origen asiático."),
    emojiFrutas(
        emoji: "🍋",
        nombre: "Limón",
        descripcion: "El término limón es un nombre común de tres frutas cítricas fragantes y de sabor ácido, utilizadas principalmente en el sector alimentario. En primer lugar, se conoce como limones a aquellos frutos producidos por el híbrido Citrus × aurantifolia, árbol llamado popularmente limonero."),
    emojiFrutas(
        emoji: "🐉🍉",
        nombre: "Fruta del dragón",
        descripcion: "Pitires o fruta del dragón son nombres de los frutos de diversas especies del género Selenicereus de la familia Cactaceae, proveniente de América especialmente de Estados Unidos o México"),
    emojiFrutas(
        emoji: "⭐️🍉",
        nombre: "Fruta de estrella",
        descripcion: "La Averrhoa carambola es un arbusto tropical perenne, perteneciente a la familia oxalidaceae. Su fruto es la carambola, que también recibe los nombres de asterisa, fruta de estrella (por su apariencia a una estrella al observar su corte transversalmente)")
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            
            List(listaEmojis) {
                
                emojiFrutas in
                NavigationLink(
                    destination: detallesView(emojiFruta: emojiFrutas)) {
                    
                    HStack {
                        
                        emojiCirculoVista( emojiFruta: emojiFrutas )
                        Text(emojiFrutas.nombre).font(.headline)
                        
                    }.padding(5)
                    
                } // NavigationLink
                .navigationBarTitle("Frutas")
                
            } // List
            
        } // NavigationView
    } // body
}

struct detallesView: View {
    
    let emojiFruta: emojiFrutas
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                
                emojiCirculoVista( emojiFruta: emojiFruta ).padding()
                Text(emojiFruta.nombre)
                    .font(.title)
                    .bold()
                Spacer()
                
            }
            
            Text(emojiFruta.descripcion)
                .padding(.top)
            Spacer()
            
        }
        .padding()
        .navigationBarTitle(Text(emojiFruta.nombre), displayMode: .large)
        
    }
    
}


struct emojiCirculoVista: View {
    
    let emojiFruta: emojiFrutas
    
    var body: some View {
        
        ZStack {
            
            Text(emojiFruta.emoji).shadow(radius: 5)
                .font(.largeTitle)
                .frame(width: 65, height: 65)
                .overlay(Circle().stroke(Color.blue, lineWidth: 3.0))
            
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
