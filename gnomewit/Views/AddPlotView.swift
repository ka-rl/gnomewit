//
//  AddPlotView.swift
//  gnomewit
//
//  Created by yelloxmo on 6/26/25.
//

import SwiftUI

struct AddPlotView: View {
    
    @Binding var isPresented: Bool
    
    @State private var plotName: String = ""
    @State private var plotLocation: String = ""
    
    var onSave: (Plot) -> Void
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Plot Name")) {
                    TextField("Enter name", text: $plotName)
                }
                Section(header: Text("Location")) {
                    TextField("e.g. Bedroom, Eastside", text: $plotLocation)
                }
            }
            .navigationTitle("New Plot")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        let newPlot = Plot(
                            id: UUID(),
                            name: plotName,
                            location: plotLocation
                        )
                        onSave(newPlot)
                        isPresented = false
                    }
                    .disabled(plotName.isEmpty)
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
            }
        }
    }
    
}
