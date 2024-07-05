//
//  Paletyr.swift
//  ClooFit
//
//  Created by Flavio Stuppia on 05/07/24.
//

import SwiftUI

struct Palette: View {
    var body: some View {
        
            VStack(alignment: .leading) {
                
                HStack {
                    Text("Your Palette")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .font(.system(size: 30))
                        .foregroundColor(Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255))
                        .padding()
                }
                .padding(.vertical)
            }
            
            
            
        ScrollView{
            VStack(alignment: .leading){
                Text("Clothes Palette")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                HStack{
                    Image("Palette")
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
            }
            
            
            VStack(alignment: .leading){
                Text("Jewelry palette")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                HStack{
                    Image("Palette")
                        .padding(.horizontal)
                }
                .padding(.vertical)
                
            }
            Spacer()
            Text("You're a Winter")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .fontWeight(.semibold)
            
            VStack {
                Spacer()
                
                ZStack {
                    // Sfondo del banner
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255))
                        .frame(height: 150)
                    
                    // Contenuto del banner
                    VStack(spacing: 10) {
                        Text("Find out what your palettes are, to best match clothes ")
                            .font(.title2)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 300)
                        HStack{
                            Text("Take the test")
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.horizontal)
                            //Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                            
                        }
                    }
                }
                .padding()
                .shadow(radius: 5)
                
                
                Spacer()
            }
            
        }
    }}

#Preview {
    Palette()
}


 

