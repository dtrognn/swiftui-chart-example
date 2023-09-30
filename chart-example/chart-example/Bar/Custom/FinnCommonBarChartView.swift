//
//  FinnCommonBarChartView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import Combine
import DGCharts
import SwiftUI

public struct FinnCommonBarChartView: UIViewRepresentable {
    public typealias UIViewType = CommonBarChartView

    @ObservedObject var store: FinnCommonBarChartVM

    public init(store: FinnCommonBarChartVM) {
        self.store = store
    }

    public func makeUIView(context: Context) -> CommonBarChartView {
        let chart = store.barChart
        let marker = CommonMarkerView()
        chart.marker = marker
        chart.setupView()

        return chart
    }

    public func updateUIView(_ uiView: CommonBarChartView, context: Context) {}
}

public class FinnCommonBarChartVM: ObservableObject {
    var barChart = CommonBarChartView()

    public var onReceiveValueSelected = PassthroughSubject<CustomBarChartDataEntry, Never>()

    public init() {}

    public func updateGranularity(_ value: Double) {
        barChart.xAxis.granularity = value
    }

    public func setDataSetBarChart(_ dataSets: [CommonBarChartDataSet]) {
        barChart.setDataSets(dataSets)
    }

    public func formatXAxisBarChart(_ valueDormatter: AxisValueFormatter) {
        barChart.xAxis.valueFormatter = valueDormatter
    }

    public func setVisibleXRangeMaximum(x: Double) {
        barChart.setVisibleXRangeMaximum(x)
    }
}
