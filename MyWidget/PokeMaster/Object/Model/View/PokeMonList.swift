//
//  PokeMonList.swift
//  PokeMaster
//
//  Created by 王潇 on 2020/11/11.
//

import SwiftUI

struct PokeMonList: View {
    var body: some View {
        
        List(PokemonViewModel.all) { pokemon in
            PokemonInfoRow(model: pokemon, expanded: false)
        }
    }
}

struct PokeMonList_Previews: PreviewProvider {
    static var previews: some View {
        PokeMonList()
    }
}
