//
//  ItemListView.swift
//  ClooFit
//
//  Created by Paolo Sortino on 05/07/24.
//

import SwiftUI

struct ItemListView: View {
    var body: some View {
        ScrollView {
            ItemView(item: catalogo[0])
            ItemView(item: catalogo[1])
        }
    }
}

#Preview {
    ItemListView()
}
