//
//  DetailView.swift
//  bbtbilisim
//
//  Created by Doğancan Mavideniz on 28.11.2023.
//

import SwiftUI

struct DetailView: View {
    
    let character: Result
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image)) { image in
                image.image?.resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            
            Text(character.name)
            Text(character.species.rawValue)
            Text(character.status.rawValue)
            
        }
    }
}

#Preview {
    DetailView(character: .init(id: 1, name: "Doğancan", status: Status(rawValue: "") ?? Status.alive, species: Species(rawValue: "") ?? Species.human, gender: Gender(rawValue: "") ?? Gender.male, image: "https://m.media-amazon.com/images/M/MV5BZjRjOTFkOTktZWUzMi00YzMyLThkMmYtMjEwNmQyNzliYTNmXkEyXkFqcGdeQXVyNzQ1ODk3MTQ@._V1_FMjpg_UX1000_.jpg"))
}
