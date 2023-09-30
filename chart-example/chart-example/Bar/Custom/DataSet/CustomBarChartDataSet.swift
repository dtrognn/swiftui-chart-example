//
//  CustomBarChartDataSet.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import DGCharts
import Foundation

public class CustomBarChartDataEntry: BarChartDataEntry {}

open class CustomBarChartDataSet: BarChartDataSet {
    override init(entries: [ChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    public init(entries: [CustomBarChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    public required init() {
        fatalError("init() has not been implemented")
    }

    open func setupView(barColor: UIColor, drawValueEnable: Bool) {
        self.setColor(barColor)
        self.drawValuesEnabled = drawValueEnable
    }

    open func addDataEntry(_ customChartDataEntry: CustomBarChartDataEntry) {
        self.append(customChartDataEntry)
    }
}
