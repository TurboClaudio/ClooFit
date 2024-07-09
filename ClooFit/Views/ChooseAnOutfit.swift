//
//  view.swift
//  view
//
//  Created by Giuseppe Guagliardo on 04/07/24.
//

import SwiftUI

struct UpperSwipeView: View {
    var items: [article]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentPage) {
                ForEach(0..<items.count, id: \.self) { index in
                    items[index].image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 180)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 180)
        }
    }
}

struct UpperSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        UpperSwipeView(items: uppers)
    }
}

struct LowerSwipeView: View {
    var items: [article]
    @State private var currentPage = 0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $currentPage) {
                ForEach(0..<items.count, id: \.self) { index in
                    items[index].image
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 250)
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: 250)
            .offset(y: -50)
        }
    }
}

struct LowerSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        LowerSwipeView(items: lowers)
    }
}

struct ChooseAnOutfit: View {
    @State private var vestiti_eleganti = false
    
    var body: some View {
        VStack {
            UpperSwipeView(items: uppers)
                .padding(.bottom, 10)
            
            LowerSwipeView(items: lowers)
                .padding(.bottom, 10)    
            
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "cloud")
                        .imageScale(.large)
                        .padding(.horizontal, 10)
                    Text("Maybe it's raining...")
                }
                HStack {
                    Image(systemName: "puzzlepiece.extension.fill")
                        .imageScale(.large)
                        .padding(.horizontal, 10)
                    Toggle("Formal Event", isOn: $vestiti_eleganti)
                }
            }
            .padding()
        }
        .navigationTitle("")
    }
}

struct ChooseAnOutfit_Previews: PreviewProvider {
    static var previews: some View {
        ChooseAnOutfit()
    }
}


#Preview {
    ChooseAnOutfit()
}
