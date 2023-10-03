//
//  FinnLineChartView.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import SwiftUI

struct FinnLineChartView: View {
    @StateObject private var vm = LineChartVM()
    @StateObject private var lineChartVM = FinnCommonLineChartVM()

    var body: some View {
        VStack {
            FinnCommonLineChartView(viewModel: lineChartVM)
                .onReceive(vm.onUpdateLineChartData) { dataSet in
                    lineChartVM.setDataSetLineChart([dataSet])
                    lineChartVM.setVisibleXRangeMaximum(7.0)
                }
        }.onAppear {
            vm.setupData()
        }
    }
}

struct FinnLineChartView_Previews: PreviewProvider {
    static var previews: some View {
        FinnLineChartView()
    }
}
