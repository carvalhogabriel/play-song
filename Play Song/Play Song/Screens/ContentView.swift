//
//  ContentView.swift
//  Play Song
//
//  Created by Gabriel Carvalho Guerrero on 01/12/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        RoundedButton(title: "Meu titulo") {
            print("RoundedButton Tapped")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
