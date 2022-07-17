import Foundation

let ball = OvalShape(width: 40, height: 40)

var barriers: [Shape] = []
var targets: [Shape] = []

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]

let funnel = PolygonShape(points: funnelPoints)

var level = 0

fileprivate func setupBall() {
    ball.position = Point(x: 250, y: 400)
    scene.add(ball)
    ball.hasPhysics = true
    ball.fillColor = .blue
    ball.isDraggable = false
    
    ball.onCollision = ballCollided(with:)
    
    scene.trackShape(ball)
    ball.onExitedScene = ballExitedScene
    
    ball.onTapped = resetGame
    
    ball.bounciness = 0.6
}

fileprivate func setupFunnel() {
    funnel.position = Point(x: 200, y: scene.height - 25)
    scene.add(funnel)
    funnel.onTapped = dropBall
    funnel.fillColor = .gray
    funnel.isDraggable = false
}

func addBarriers(_ barrierGameObjects: [Barrier]) {
    for barrier in barrierGameObjects {
        let shape = barrier.shape
        barriers.append(shape)
        scene.add(shape)
    }
}

func addTargets(_ targetGameObjects: [Target]) {
    for target in targetGameObjects {
        let shape = target.shape
        targets.append(shape)
        scene.add(shape)
    }
}

func setupLevel() {
    for barrier in barriers {
        scene.remove(barrier)
    }
    for target in targets {
        scene.remove(target)
    }
    
    barriers = []
    targets = []
    
    addBarriers(game.levels[level].barriers)
    addTargets(game.levels[level].targets)
    
    funnel.position = Point(x: game.levels[level].funnelHorizontalPosition, y: scene.height - 25)
    
    resetGame()
}

func setup() {
    setupBall()
    setupFunnel()
    setupLevel()
    
    scene.onShapeMoved = printPosition(of:)
}

func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
    
    for target in targets {
        target.fillColor = .yellow
    }
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    
    otherShape.fillColor = .green
}

func ballExitedScene() {
    for barrier in barriers {
        barrier.isDraggable = true
    }
    
    var hitTargets = 0
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    
    if hitTargets == targets.count {
        scene.presentAlert(text: "You won!", completion: alertDismissed)
    }
}

func alertDismissed() {
    if level < game.levels.count - 1 {
        level += 1
        setupLevel()
    }
}

// Resets the game by moving the ball below the scene,
// which will unlock the barriers.
func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition(of shape: Shape) {
    print(shape.position)
}
