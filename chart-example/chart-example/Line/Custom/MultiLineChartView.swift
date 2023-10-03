//
//  MultiLineChartView.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import DGCharts
import Foundation

public class MultipleLineChartView: LineChartView {
    public func setupView() {
        configCommon()
        configHighlight()
        configZoomAndDrag()
        configXAxis()
        configLeftAxis()
        configLegend()
    }

    open func configCommon() {
        dragEnabled = true
        noDataText = ""
        setScaleEnabled(true)
        rightAxis.enabled = false
        animate(yAxisDuration: TimeInterval(1.5))
    }

    open func configHighlight() {
        highlightPerTapEnabled = true
    }

    open func configZoomAndDrag() {
//        pinchZoomEnabled = true
        doubleTapToZoomEnabled = false
        dragXEnabled = true
    }

    open func configXAxis() {
//        xAxis.drawAxisLineEnabled = true
        xAxis.drawLabelsEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12, weight: .regular)
        xAxis.labelTextColor = .black
        xAxis.gridLineDashLengths = [5, 5]
    }

    open func configLeftAxis() {
        leftAxis.drawLabelsEnabled = true
        leftAxis.labelFont = .systemFont(ofSize: 12, weight: .regular)
        leftAxis.labelTextColor = .black
        leftAxis.gridLineDashLengths = [5, 5]
        leftAxis.gridLineDashPhase = 0
        leftAxis.removeAllLimitLines()
    }

    open func configLegend() {
        legend.horizontalAlignment = .left
        legend.verticalAlignment = .bottom
        legend.yOffset = 50
        legend.enabled = true
        legend.drawInside = false
        legend.form = .line
    }

    public func setDataSets(_ dateSets: [CustomLineChartDataSet]) {
        highlightValues(nil)
        data = LineChartData(dataSets: dateSets)
    }

    public func addDataSet(_ chartDataSet: ChartDataSet) {
        data?.dataSets.append(chartDataSet)
    }

    open func setNegativeValue(_ isSupport: Bool) {
        if isSupport {
            leftAxis.resetCustomAxisMin()
        } else {
            leftAxis.axisMinimum = 0.0
        }
    }

    open func hideHighValues() {
        highlightValues(nil)
    }

    func showHighValues() {}
}
