import Foundation

struct Barrier {
    var width: Double
    var height: Double
    var position: Point
    var angle: Double
    
    var shape: PolygonShape {
        let barrierPoints = [
            Point(x: 0, y: 0),
            Point(x: 0, y: height),
            Point(x: width, y: height),
            Point(x: width, y: 0)
        ]
        
        let barrier = PolygonShape(points: barrierPoints)
                
        barrier.position = position
        barrier.hasPhysics = true
        barrier.isImmobile = true
        barrier.fillColor = .brown
        barrier.angle = angle
        
        return barrier
    }
}

struct Target {
    var position: Point
    
    var shape: PolygonShape {
        let targetPoints = [
            Point(x: 10, y: 0),
            Point(x: 0, y: 10),
            Point(x: 10, y: 20),
            Point(x: 20, y: 10)
        ]

        let target = PolygonShape(points: targetPoints)
        
        target.position = position
        target.hasPhysics = true
        target.isImmobile = true
        target.isImpermeable = false
        target.fillColor = .yellow
        target.name = "target"
        target.isDraggable = false

        return target
    }
}

struct Level {
    var barriers: [Barrier]
    var targets: [Target]
    var funnelHorizontalPosition: Double
}

struct Game {
    var levels: [Level]
}

let level1 = Level (
    barriers: [
        Barrier(width: 80, height: 25, position: Point(x: 40, y: 150), angle: 0.1),
        Barrier(width: 50, height: 15, position: Point(x: 150, y: 150), angle: 0.2),
        Barrier(width: 25, height: 15, position: Point(x: 300, y: 150), angle: -0.15)
    ],
    targets: [
        Target(position: Point(x: 145, y: 623)),
        Target(position: Point(x: 203, y: 668)),
        Target(position: Point(x: 235, y: 505)),
        Target(position: Point(x: 183, y: 353)),
        Target(position: Point(x: 143, y: 195)),
        Target(position: Point(x: 29, y: 230))
    ],
    funnelHorizontalPosition: 150
)

let level2 = Level (
    barriers: [
        Barrier(width: 50, height: 15, position: Point(x: 40, y: 150), angle: 0.3),
        Barrier(width: 50, height: 15, position: Point(x: 150, y: 150), angle: 0.2),
        Barrier(width: 25, height: 15, position: Point(x: 300, y: 150), angle: 0),
        Barrier(width: 300, height: 15, position: Point(x: 300, y: 150), angle: -1),
        Barrier(width: 50, height: 15, position: Point(x: 300, y: 150), angle: .pi / 2)
    ],
    targets: [
        Target(position: Point(x: 65, y: 692)),
        Target(position: Point(x: 93, y: 571)),
        Target(position: Point(x: 215, y: 391)),
        Target(position: Point(x: 340, y: 300)),
        Target(position: Point(x: 340, y: 118)),
        Target(position: Point(x: 222, y: 21))
    ],
    funnelHorizontalPosition: 150
)

let tutorial = Level (
    barriers: [
    ],
    targets: [
        Target(position: Point(x: 250, y: 150))
    ],
    funnelHorizontalPosition: 250
)


let game = Game(levels: [tutorial, level1, level2])
