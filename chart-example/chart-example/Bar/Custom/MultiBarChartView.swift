//
//  MultiBarChartView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import DGCharts
import Foundation

public class MultipleBarChartView: BarChartView {
    public func setupView() {
        self.configCommon()
        self.configHighlight()
        self.configZoomAndDrag()
        self.configXAxis()
        self.configLeftAxis()
        self.configLegend()
    }

    open func configCommon() {
        self.noDataText = ""
        self.setScaleEnabled(true)
        self.rightAxis.enabled = false
        self.animate(yAxisDuration: TimeInterval(1.5))
    }

    open func configHighlight() {
        self.highlightPerTapEnabled = true
        self.highlightPerDragEnabled = false
    }

    open func configZoomAndDrag() {
        pinchZoomEnabled = false
        doubleTapToZoomEnabled = false
        dragXEnabled = true
    }

    open func configXAxis() {
        xAxis.drawLabelsEnabled = true
        xAxis.drawGridLinesEnabled = true
        xAxis.labelPosition = .bottom
        xAxis.labelCount = 6
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
        leftAxis.labelCount = 8
        leftAxis.spaceTop = 0.15
        leftAxis.axisMinimum = 0
        leftAxis.removeAllLimitLines()
    }

    open func configLegend() {
        legend.horizontalAlignment = .left
        legend.verticalAlignment = .bottom
        legend.yOffset = 60
        legend.enabled = true
        legend.drawInside = false
        legend.form = .line
    }

    public func setDataSets(_ dateSets: [CommonBarChartDataSet]) {
        self.highlightValues(nil)
        self.data = BarChartData(dataSets: dateSets)
    }

    public func addDataSet(_ chartDataSet: BarChartDataSet) {
        self.data?.dataSets.append(chartDataSet)
    }
}
