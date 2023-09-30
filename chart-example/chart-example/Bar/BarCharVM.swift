//
//  BarCharVM.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import Combine
import Foundation

class BarChartVM: ObservableObject {
    private var chartData: [CustomBarChartDataEntry] = []
    var onUpdateBarChartData = PassthroughSubject<CommonBarChartDataSet, Never>()

    init() {
        (0 ..< 20).forEach { index in
            chartData.append(CustomBarChartDataEntry(x: Double(index), y: Double.random(in: 10 ..< 30)))
        }

        setupData()
    }

    func setupData() {
        let dataSet = CommonBarChartDataSet(entries: chartData, label: "Bar chart")
        dataSet.setup()
        onUpdateBarChartData.send(dataSet)
    }
}
