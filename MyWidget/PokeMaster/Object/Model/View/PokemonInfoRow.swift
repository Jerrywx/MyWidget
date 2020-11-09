//
//  PokemonInfoRow.swift
//  PokeMaster
//
//  Created by J on 2020/11/9.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonInfoRow: View {
    
//    let model = PokemonViewModel.sample(id: 1)
    
    let model: PokemonViewModel
    
    @State var expanded: Bool
    
    var body: some View {
        
        let gradient = Gradient(colors: [.white, model.color])
        let gradientStyle = LinearGradient(gradient: gradient,
                                           startPoint: .leading,
                                           endPoint: .trailing)
        
        VStack {
            HStack {
                Image("Pokemon-\(model.id)")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .shadow(radius: 4)
                
                
                Spacer()
                VStack(alignment: .trailing) {
                    Text(model.name)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                    Text(model.nameEN)
                        .font(.subheadline)
                        .foregroundColor(.white)
                }
            }.padding(.top, 12)
            
            Spacer()
            
            HStack(spacing: expanded ? 20 : -30) {
                Spacer()
                Button(action: {
                    print("fav")
                }) {
                    Image(systemName: "star")
                        .modifier(ToolButtonModifier())
                }
                
                Button(action: {
                    print("Panel")
                }) {
                    Image(systemName: "chart.bar")
                        .modifier(ToolButtonModifier())
                }
                
                Button(action: {
                    print("Web")
                }) {
                    Image(systemName: "info.circle")
                        .modifier(ToolButtonModifier())
                }
            }
            .padding(.bottom, 12)
            .opacity(expanded ? 1.0 : 0.0)
            .frame(maxHeight: expanded ? .infinity : 0)
            
        }
        .frame(height: expanded ? 120 : 80)
        .padding(.leading, 23)
        .padding(.trailing, 15)
        .background(
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(model.color, style: StrokeStyle(lineWidth: 4))
                    RoundedRectangle(cornerRadius: 20)
                                .fill(gradientStyle)
                
            }
        )
        .padding(.horizontal)
        .animation(.default)
        .onTapGesture {
            self.expanded.toggle()
            print("------\n")
        }
        
    }
}

struct PokemonInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PokemonInfoRow(model: .sample(id: 1), expanded: false)
            PokemonInfoRow(model: .sample(id: 21), expanded: false)
            PokemonInfoRow(model: .sample(id: 25), expanded: false)
        }
    }
}
