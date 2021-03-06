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
    @State private var tipPercentage = 3
    
    let tipPercentages = [0, 10, 15, 20, 25]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(billAmount) ?? 0

        let tipValue = orderAmount * tipSelection / 100
        let grandTotal = orderAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Montant de l'addition", text: $billAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Nombre de personnes", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) personnes")
                        }
                    }
                    
                }
                
                Section(header: Text("Combien de pourboire laisser ?")) {
                    Picker("Pourcentage du pourboire", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Montant par personne")) {
                    Text("\(totalPerPerson, specifier: "%.2f") €")
                }
                
                // Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
                Section {
                    Text("Montant total : \(grandTotal, specifier: "%.2f") €")
                }

                
            }
            .navigationBarTitle("WeSplit")
            
           
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

