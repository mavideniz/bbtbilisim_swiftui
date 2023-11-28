//
//  ContentView.swift
//  bbtbilisim
//
//  Created by Doğancan Mavideniz on 28.11.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var characters = [Result]()
    
    var body: some View {
        NavigationView {
            List(characters, id: \.id) { character in
                NavigationLink(destination: DetailView(character: character)) {
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.image?.resizable()
                        }
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading) {
                            Text(character.name)
                            Text(character.species.rawValue)
                            Text(character.status.rawValue)
                        }
                    }
                }
            }
            .navigationTitle("Rick and Morty")
            .onAppear {
                RickAndMortyService().fetchCharacters { charactersData in
                    self.characters = charactersData.results
                }
            }
        }
        
    }
}

#Preview {
    ContentView()
}
