//
//  CommonBarChartDataSet.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

public class CommonBarChartDataSet: CustomBarChartDataSet {
    override init(entries: [CustomBarChartDataEntry], label: String) {
        super.init(entries: entries, label: label)
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    public func setup() {
        super.setupView(barColor: .brown, drawValueEnable: false)
    }
}
