//
//  FinnBarChartView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import SwiftUI

struct FinnBarChartView: View {
    @StateObject private var vm = BarChartVM()
    @StateObject private var barChartVM = FinnCommonBarChartVM()

    var body: some View {
        VStack {
            FinnCommonBarChartView(viewModel: barChartVM)
                .onReceive(vm.onUpdateBarChartData) { dataSet in
                    barChartVM.setDataSetBarChart([dataSet])
                    barChartVM.setVisibleXRangeMaximum(x: 7.0)
                }
        }.onAppear {
            vm.setupData()
        }
    }
}

struct FinnBarChartView_Previews: PreviewProvider {
    static var previews: some View {
        FinnBarChartView()
    }
}
