//
//  BindingEx.swift
//  BookWorm
//
//  Created by Andres Gutierrez on 4/21/22.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    // @Binding will effect the boolean being passed in, so the ContentV Struct State will be updated. ContentV will toggle.
    // if @State, then the Bool being passed will ONLY effect the PushButton Struct, and not the State of ContentV. ContentV will stay false.
    
    let onColors    = [Color.red, Color.yellow]
    let offColors   = [Color(white: 0.6), Color(white: 0.4)]
    // White: 1 = Fully white.
    // White: 0.5 = Gray
    // White: 0.0 = Fully black.

    var body: some View{
        Button(title){
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundColor(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentV: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack{
            PushButton(title: "Remember Me?", isOn: $rememberMe)
            Text(rememberMe ? "ON" : "OFF")
        }
    }
}

struct ContentV_Previews: PreviewProvider {
    static var previews: some View {
        ContentV()
    }
}
