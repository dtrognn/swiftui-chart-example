//
//  CommonMarkerView.swift
//  chart-example
//
//  Created by dtrognn on 30/09/2023.
//

import DGCharts
import Foundation

class CommonMarkerView: MarkerView {
    private var label: String = ""

    fileprivate let font: UIFont = .systemFont(ofSize: 12)
    fileprivate var yFormatter = NumberFormatter()
    private(set) var fillColor: UIColor = .white
    private(set) var strokeColor: UIColor = .brown
    private(set) var textColor: UIColor = .black
    private var attrs: [NSAttributedString.Key: AnyObject]!

    init() {
        yFormatter.minimumFractionDigits = 0
        yFormatter.maximumFractionDigits = 1

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        attrs = [.font: font, .paragraphStyle: paragraphStyle, .foregroundColor: textColor, .baselineOffset: NSNumber(value: -4)]

        super.init(frame: CGRect())
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func refreshContent(entry: ChartDataEntry, highlight: Highlight) {
        label = String(format: "x: %@ - y: %@",
                       yFormatter.string(from: NSNumber(value: entry.x))!,
                       yFormatter.string(from: NSNumber(value: entry.y))!)
    }

    override func draw(context: CGContext, point: CGPoint) {
        let labelWidth = label.size(withAttributes: attrs).width + 10
        let labelHeight = label.size(withAttributes: attrs).height + 4

        var rectangle = CGRect(x: point.x, y: point.y, width: labelWidth, height: labelHeight)
        let spacing: CGFloat = 20
        let rectangleHalfWidth = rectangle.width / 2.0
        if rectangle.origin.x >= rectangleHalfWidth {
            rectangle.origin.x -= rectangleHalfWidth
        }

        rectangle.origin.y -= rectangle.height + spacing

        let clipPath = UIBezierPath(roundedRect: rectangle, cornerRadius: 6.0).cgPath
        context.addPath(clipPath)
        context.setFillColor(fillColor.cgColor)
        context.setStrokeColor(strokeColor.cgColor)
        context.closePath()
        context.drawPath(using: .fillStroke)

        label.draw(with: rectangle, options: .usesLineFragmentOrigin, attributes: attrs, context: nil)
    }
}
