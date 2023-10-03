//
//  FinnCommonLineChartView.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import Combine
import DGCharts
import Foundation
import SwiftUI

public struct FinnCommonLineChartView: UIViewRepresentable {
    public typealias UIViewType = CommonLineChartView

    @ObservedObject var viewModel: FinnCommonLineChartVM

    public init(viewModel: FinnCommonLineChartVM) {
        self.viewModel = viewModel
    }

    public func makeUIView(context: Context) -> CommonLineChartView {
        let chart = viewModel.lineChart
        let marker = CommonMarkerView()
        chart.marker = marker
        chart.setupView()
        return chart
    }

    public func updateUIView(_ uiView: CommonLineChartView, context: Context) {}
}

public class FinnCommonLineChartVM: ObservableObject {
    var lineChart = CommonLineChartView()

    public var onReceiveValueSelected = PassthroughSubject<CustomChartDataEntry, Never>()

    public init() {
//        lineChart.actionChartValueSelected = { [weak self] chartEntry in
//            self?.onReceiveValueSelected.send(chartEntry)
//        }
    }

    public func updateGranularity(_ value: Double) {
        lineChart.xAxis.granularity = value
    }

    public func setDataSetLineChart(_ dataSets: [CommonLineChartDataSet]) {
        lineChart.clear()
        lineChart.setDataSets(dataSets)
    }

    public func formatXAxisLineChart(_ valueDormatter: AxisValueFormatter) {
        lineChart.xAxis.valueFormatter = valueDormatter
    }

    public func moveViewTo(_ value: Double) {
        lineChart.moveViewToX(value)
    }

    public func setVisibleXRangeMaximum(_ value: Double) {
        lineChart.setVisibleXRangeMaximum(value)
    }
}
