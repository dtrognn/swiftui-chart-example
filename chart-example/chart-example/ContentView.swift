//
//  ContentView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("dadasd")
                .tabItem {
                    Image("line-chart").renderingMode(.template)
                        .background(Color.red)
                }

            FinnBarChartView()
                .tabItem {
                    Image("bar-chart").renderingMode(.template)
                        .background(Color.red)
                }
        }.accentColor(.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
