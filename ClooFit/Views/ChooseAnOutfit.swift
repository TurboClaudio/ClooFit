//
//  ChooseAnOutfit.swift
//  ChooseAnOutfit
//
//  Created by Giuseppe Guagliardo on 04/07/24.
//

import SwiftUI


struct UpperSwipeView: View {
    var items: [article]
    var articleSelected: article
    @Binding var currentPage: Int
    
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

struct LowerSwipeView: View {
    var items: [article]
    var articleSelected: article
    @Binding var currentPage: Int
    
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

struct ChooseAnOutfit: View {
    
    @State var vestiti_eleganti: Bool
    @State var upperSelected: article
    @State var lowerSelected: article
    @State var currentUpperIndex: Int
    @State var currentLowerIndex: Int
    @State var currentFormalUpperIndex = 0
    @State var currentInformalUpperIndex = 0
    @State var currentFormalLowerIndex = 0
    @State var currentInformalLowerIndex = 0
    
    @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            VStack {
                UpperSwipeView(items: uppers ?? [], articleSelected: upperSelected, currentPage: $currentUpperIndex)
                    .padding(.bottom, 10)
                
                LowerSwipeView(items: lowers ?? [], articleSelected: lowerSelected, currentPage: $currentLowerIndex)
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
                            .onChange(of: vestiti_eleganti) { _ in updateArticles() }
                    }
                }
                .padding()
            }
            .onAppear { initializeArticles() }
            .navigationTitle("")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    
    func initializeArticles() {
        
        let uppersUnfiltered = typeFilter(from: catalogo, type: "top")
        let uppersUnfiltered2 = genderFilter(from: uppersUnfiltered ?? [], gender: "man")

        let lowersUnfiltered = typeFilter(from: catalogo, type: "bottom")
        let lowersUnfiltered2 = genderFilter(from: lowersUnfiltered ?? [], gender: "man")
        
        if vestiti_eleganti {
            uppers = eleganceFilter(from: uppersUnfiltered2 ?? [], elegance: "formal")
            lowers = eleganceFilter(from: lowersUnfiltered2 ?? [], elegance: "formal")
                   
            currentFormalUpperIndex = currentUpperIndex
            currentFormalLowerIndex = currentLowerIndex
            
        }else {
            uppers = eleganceFilter(from: uppersUnfiltered2 ?? [], elegance: "informal")
            lowers = eleganceFilter(from: lowersUnfiltered2 ?? [], elegance: "informal")
                   
            currentInformalUpperIndex = currentUpperIndex
            currentInformalLowerIndex = currentLowerIndex
        }
    }
    
    func updateArticles() {
        
        let uppersUnfiltered = typeFilter(from: catalogo, type: "top")
        let uppersUnfiltered2 = genderFilter(from: uppersUnfiltered ?? [], gender: "man")

        let lowersUnfiltered = typeFilter(from: catalogo, type: "bottom")
        let lowersUnfiltered2 = genderFilter(from: lowersUnfiltered ?? [], gender: "man")
        
        if vestiti_eleganti {
            uppers = eleganceFilter(from: uppersUnfiltered2 ?? [], elegance: "formal")
            lowers = eleganceFilter(from: lowersUnfiltered2 ?? [], elegance: "formal")
            
            // Memorizzo gli indici informali prima di switchare ai formali
            currentInformalUpperIndex = currentUpperIndex
            currentInformalLowerIndex = currentLowerIndex
            
            // Switcho agli indici formali
            currentUpperIndex = currentFormalUpperIndex
            currentLowerIndex = currentFormalLowerIndex
        } else {
            uppers = eleganceFilter(from: uppersUnfiltered2 ?? [], elegance: "informal")
            lowers = eleganceFilter(from: lowersUnfiltered2 ?? [], elegance: "informal")
            
            // Memorizzo gli indici formali prima di switchare agli informali
            currentFormalUpperIndex = currentUpperIndex
            currentFormalLowerIndex = currentLowerIndex
            
            // Switcho agli indici informali
            currentUpperIndex = currentInformalUpperIndex
            currentLowerIndex = currentInformalLowerIndex
        }
    }
}

/*#Preview {
    LowerSwipeView(items: lowers ?? [], articleSelected: lowers[0] ?? [], currentPage: 0)
}*/
