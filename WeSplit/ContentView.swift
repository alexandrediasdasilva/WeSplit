//
//  ContentView.swift
//  WeSplit
//
//  Created by Alexandre Dias Da Silva on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var billAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        
        Form {
            Section {
                TextField("Placeholder", text: $billAmount)
                    .keyboardType(.decimalPad)
            }
            
            Section {
                Text("\(billAmount) €")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
