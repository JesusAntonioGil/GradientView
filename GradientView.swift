//
//  GradientView.swift
//  CodeRandom
//
//  Created by Jesus Antonio Gil on 23/1/25.
//

import SwiftUI


struct GradientView: View {
    @State var isAnimating: Bool = false
    private let gradient = Gradient(colors: [.red, .blue, .yellow])
    
    
    var body: some View {
        ZStack {
            Color.black
            
            LinearGradient(gradient: gradient,
                           startPoint: isAnimating ? .topTrailing : .bottomLeading,
                           endPoint: isAnimating ? .bottomTrailing : .center)
            .animation(.easeInOut(duration: 1)
                .repeatForever(autoreverses: true), value: isAnimating)
            .frame(width: 200, height: 86)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .blur(radius: 8)
            
            Button("Gradient Button") { }
                .font(.system(size: 32, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 200, height: 86)
                .background(.black)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .ignoresSafeArea()
        .onAppear {
            isAnimating.toggle()
        }
    }
}

#Preview {
    GradientView()
}
