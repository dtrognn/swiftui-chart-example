//
//  LineChartVM.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import Combine
import Foundation

class LineChartVM: ObservableObject {
    private var chartData: [CustomChartDataEntry] = []
    var onUpdateLineChartData = PassthroughSubject<CommonLineChartDataSet, Never>()

    init() {
        (0 ..< 20).forEach { index in
            chartData.append(CustomChartDataEntry(x: Double(index), y: Double.random(in: 10 ..< 30)))
        }
    }

    func setupData() {
        let dataSet = CommonLineChartDataSet(entries: chartData, label: "Line chart")
        dataSet.setup()
        onUpdateLineChartData.send(dataSet)
    }
}
