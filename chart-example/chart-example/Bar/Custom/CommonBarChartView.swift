//
//  CommonBarChartView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import DGCharts
import Foundation

public class CommonBarChartView: MultipleBarChartView {
    public var actionChartValueSelected: ((CustomBarChartDataEntry) -> Void)?
    public var actionChartValueNothingSelected: (() -> Void)?

    override public func setupView() {
        super.setupView()
        delegate = self
    }

    override public func configXAxis() {
        super.configXAxis()
        xAxis.granularityEnabled = true
        xAxis.granularity = 1
    }
}

extension CommonBarChartView: ChartViewDelegate {
    public func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        actionChartValueSelected?(CustomBarChartDataEntry(x: entry.x, y: entry.y))
    }

    public func chartViewDidEndPanning(_ chartView: ChartViewBase) {
        //  printLogMessage("chartViewDidEndPanning ")
    }

    // Called when nothing has been selected or an "un-select" has been made.
    public func chartValueNothingSelected(_ chartView: ChartViewBase) {
        actionChartValueNothingSelected?()
        //  printLogMessage("chartValueNothingSelected ")
    }

    // Callbacks when the chart is scaled / zoomed via pinch zoom gesture.
    public func chartScaled(_ chartView: ChartViewBase, scaleX: CGFloat, scaleY: CGFloat) {
        print("chartScaled  scaleX \(scaleX) scaleY \(scaleY)")
    }

    // Callbacks when the chart is moved / translated via drag gesture.
    public func chartTranslated(_ chartView: ChartViewBase, dX: CGFloat, dY: CGFloat) {
//        print("chartTranslated  dx \(dX) dY \(dY)")
    }

    // Callbacks when Animator stops animating
    public func chartView(_ chartView: ChartViewBase, animatorDidStop animator: Animator) {
        print("chartView animatorDidStop")
    }
}
