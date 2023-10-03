//
//  CustomLineChartDataSet.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import DGCharts
import Foundation

public class CustomChartDataEntry: ChartDataEntry {}

open class CustomLineChartDataSet: LineChartDataSet {
    override init(entries: [ChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    public init(entries: [CustomChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    public required init() {
        fatalError("init() has not been implemented")
    }

    open func setupView(lineColor: UIColor, highlightColor: UIColor = .red, mode: Mode = .linear, drawValuesEnabled: Bool, drawCirclesEnabled: Bool) {
        self.mode = mode
        self.lineWidth = 1
        self.setColor(lineColor)
        self.highlightColor = highlightColor
        self.drawCirclesEnabled = drawCirclesEnabled
        self.drawValuesEnabled = drawValuesEnabled
        self.drawHorizontalHighlightIndicatorEnabled = false
    }

    open func addDataEntry(_ customChartDataEntry: CustomChartDataEntry) {
        append(customChartDataEntry)
    }
}
