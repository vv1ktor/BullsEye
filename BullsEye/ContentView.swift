//
//  ContentView.swift
//  BullsEye
//
//  Created by Wiktor Gała on 13/12/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentVM()
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Welcome to BullsEye")
                .font(.title3)
            
            Text("Total score: \(viewModel.totalScore)")
            
            Text("\(viewModel.randomTarget)")
            
            HStack {
                Text("0")
                
                Slider(value: $viewModel.value, in: 1...100)
                
                Text("100")
            }
            
            Button("Submit") {
                viewModel.submit()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .alert(viewModel.alertMessage, isPresented: $viewModel.presentAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
