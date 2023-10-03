//
//  CommonLineChartDataSet.swift
//  chart-example
//
//  Created by dtrognn on 03/10/2023.
//

import Foundation

public class CommonLineChartDataSet: CustomLineChartDataSet {
    override public init(entries: [CustomChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    public required init() {
        fatalError("init() has not been implemented")
    }

    public func setup() {
        super.setupView(lineColor: .brown, highlightColor: .red, mode: .cubicBezier, drawValuesEnabled: false, drawCirclesEnabled: false)
    }
}
