//
//  Paletyr.swift
//  ClooFit
//
//  Created by Flavio Stuppia on 05/07/24.
//

import SwiftUI

struct Palette: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                // Top HStack with profile icon
                /* HStack {
                 Spacer() // To push the icon to the right
                 
                 Image(systemName: "person.circle")
                 .font(.system(size: 30))
                 .foregroundColor(Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255))
                 .padding(.horizontal)
                 }
                 .padding(.top)*/
                
                ScrollView {
                    VStack(alignment: .leading) {
                        
                        Spacer()
                        // Clothes Palette Section
                        VStack(alignment: .leading) {
                            Text("Clothes Palette")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            HStack {
                                Image("Palette")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                                    .padding(.horizontal)
                            
                            }
                            
                        }
                        
                        
                        // Jewelry Palette Section
                        VStack(alignment: .leading) {
                           Spacer()
                            Text("Jewelry Palette")
                                .font(.title)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            HStack {
                                Image("Palette")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 100)
                                    .padding(.horizontal)
                            }
                            
                        }
                        
                        
                        HStack{
                            Spacer()
                            Text("You're a Winter")
                                .font(.largeTitle)
                                .fontWeight(.bold)
        
                                .padding(.horizontal)
                            Spacer()
                        }
                        // Banner Section
                        VStack {
                          
                            ZStack {
                                // Background of the banner
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color(red: 60 / 255, green: 45 / 255, blue: 218 / 255))
                                    .frame(height: 150)
                                
                                // Banner content
                                VStack(spacing: 10) {
                                    Text("Find out what your palettes are, to best match clothes")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                        .frame(width: 300, alignment: .leading)
                                    
                                    HStack {
                                        Text("Take the test")
                                            .font(.headline)
                                            .foregroundColor(.white.opacity(0.8))
                                            .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .padding(.horizontal)
                                    }
                                }
                                .padding()
                            }
                            .padding(.horizontal)
                            .shadow(radius: 5)
                        }
                        .padding(.top)
                    }
                }
            }
            .navigationTitle("Your Palette")
        }
    }}

#Preview {
    Palette()
}
