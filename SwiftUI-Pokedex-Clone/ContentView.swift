//
//  ContentView.swift
//  SwiftUI-Pokedex-Clone
//
//  Created by af_nakandakari_toru on 2025/01/02.
//

import PokemonListScreen
import Router
import SwiftUI

struct ContentView: View {
    var body: some View {
        PokemonListView(
            router: Router(
                isPresented: .constant(.root)
            ),
            input: .init(
                withNavigation: true,
                naviBarLeadingButtonType: nil
            ),
            trigger: nil
        )
    }
}

#Preview {
    ContentView()
}
