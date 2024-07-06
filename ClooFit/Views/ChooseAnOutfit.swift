//
//  view.swift
//  view
//
//  Created by Giuseppe Guagliardo on 04/07/24.
//

import SwiftUI

struct ChooseAnOutfit: View {
    @State private var vestiti_eleganti=false
    var outfit : Outfit
    
    var body: some View {
        
    
        
        ZStack{
            VStack{
                outfit.upper.image
                    .resizable()
                    .frame(width: 200,height: 200)
                    .padding(.vertical,30)
                outfit.lower.image
                    .resizable()
                    .frame(width: 300,height: 420)
                    .padding(.vertical,-110)
                
                Spacer()
                HStack{
                  // Image(systemName: "cloud.sun.fill")
                    //    .imageScale(.large)
                     Spacer().frame(width: 18)
                    
                    Text("Maybe it's raining...")
                        .padding(.trailing,110)
                }
                
                HStack{
                   
                    Image(systemName: "puzzlepiece.extension.fill")
                        .imageScale(.large)
                    
                    Spacer().frame(width: 20)
                    
                    Toggle("Formal Event", isOn: $vestiti_eleganti)
                        
                }
                .padding(.horizontal,35)
                Spacer()
            }
           
            
            
        }
    

    }
}

#Preview {
    ChooseAnOutfit(outfit: Outfit(upper: catalogo[2], lower: catalogo[29]))
}
