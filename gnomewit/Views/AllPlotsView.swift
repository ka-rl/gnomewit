//
//  PlotView.swift
//  gnomewit
//
//  Created by yelloxmo on 6/12/25.
//

import SwiftUI

struct AllPlotsView: View {
    @State private var plots: [Plot] = []
    @State private var showingAddPlot = false
    
    var body: some View {
        NavigationView {
            List(plots) { plot in
                VStack(alignment: .leading) {
                    Text(plot.name).font(.headline)
                    Text(plot.location ?? "").font(.subheadline)
                }
            }
            .navigationTitle("My Plots")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddPlot = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPlot) {
                AddPlotView(isPresented: $showingAddPlot) {newPlot in
                    plots.append(newPlot)
                }
            }
        }
    }
}
