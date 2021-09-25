//
//  Pie.swift
//  Memorise
//
//  Created by Jerry Zhu on 25/9/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngel: Angle
    var clockwise = false
    
    func path(in rect: CGRect) -> Path {
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: start)
        path.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngel,
            clockwise: !clockwise
        )
        path.addLine(to: center)
        
        return path
    }
    
}
