//
//  ContentView.swift
//  SwiftAnimations
//
//  Created by Sadeel Muwahed on 21/08/2023.
//

//ANIMATION FORMULA
//Rule 1: Create a @State var boolean
//Rule 2: Use .withAnimation to toogle that boolean
//Rule 3: Use a tenerary operator to control animation

import SwiftUI

struct ContentView: View {
    
    //Part one of animation formula
    @State private var isSubscribed:Bool = false
    
    @State private var animatingCircle:Bool = false
    
    @State private var animatingButton:Bool = false
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //example one: list cell
            //check mark bouncing
            VStack {
                Spacer()
                HStack{
                    Text("Finish this Task").bold().opacity(isSubscribed ? 1.0 :0.5)
                    
                    Spacer()
                    
                    //icon
                    Image(systemName: isSubscribed ? "checkmark.circle.fill" : "circle").font(.system(size: 25))
                        .scaleEffect(isSubscribed ? 1.25 : 1.0)
                        .foregroundColor(isSubscribed ? .blue : .black)
                        .padding()
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1.5)) {
                                isSubscribed.toggle()
                            }
                        }
                }
                .padding()
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                
                Spacer()
                
                //example two:
                //shape with spring
                Circle().frame(width: 100,height: 100)
                    .foregroundStyle(LinearGradient(colors: [.cyan, .green], startPoint: .topTrailing, endPoint: .bottomLeading))
                    .offset(x:animatingCircle ? 10 : 0, y:animatingCircle ? 100 : 0)
                    .scaleEffect(animatingCircle ? 1.5 : 1.0)
                    .onTapGesture {
                        //customizing spring animation
                        //response is stiffness
                        //0 being the most stiff
                        //damping Fraction is the bounciness
                        //0 being the most bouncy
                        //blend duration is.. smth
                        withAnimation(.spring(response: 0.9, dampingFraction: 0.25, blendDuration: 0)){
                            animatingCircle.toggle()
                        }
                    }
                Spacer()
                
                //third example:
                //button example
                Button {
                    //action
                    withAnimation(.easeInOut(duration: 1).repeatCount(10)){
                        animatingButton.toggle()
                    }
                } label: {
                    //label
                    Text("Animate").bold()
                        .frame(width: 200, height:50)
                        .foregroundColor(.black)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(radius: 3)
                        .opacity(animatingButton ? 1.0 : 0.7)
                        .scaleEffect(animatingButton ? 1.5 : 1.0)
                }
                
                Spacer()

            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
