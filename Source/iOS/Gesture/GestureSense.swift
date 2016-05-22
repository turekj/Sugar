import UIKit

public class GestureSense {

  public typealias GestureHandler = UIGestureRecognizer -> Void

  public class Target: NSObject {

    let handler: GestureHandler

    init(handler: GestureHandler) {
      self.handler = handler
    }

    func action(gesture: UIGestureRecognizer) {
      handler(gesture)
    }
  }

  public var targets: [Target] = []

  public init() {}

  public func tap(view: UIView, handler: GestureHandler) -> UITapGestureRecognizer {
    return on(view, handler: handler) as UITapGestureRecognizer
  }

  public func pinch(view: UIView, handler: GestureHandler) -> UIPinchGestureRecognizer {
    return on(view, handler: handler) as UIPinchGestureRecognizer
  }

  public func pan(view: UIView, handler: GestureHandler) -> UIPanGestureRecognizer {
    return on(view, handler: handler) as UIPanGestureRecognizer
  }

  public func swipe(view: UIView, handler: GestureHandler) -> UISwipeGestureRecognizer {
    return on(view, handler: handler) as UISwipeGestureRecognizer
  }

  public func rotate(view: UIView, handler: GestureHandler) -> UIRotationGestureRecognizer {
    return on(view, handler: handler) as UIRotationGestureRecognizer
  }

  public func longPress(view: UIView, handler: GestureHandler) -> UILongPressGestureRecognizer {
    return on(view, handler: handler) as UILongPressGestureRecognizer
  }

  public func on<T: UIGestureRecognizer>(view: UIView, handler: GestureHandler) -> T {
    let target = Target(handler: handler)
    targets.append(target)

    if let gesture = view.gestureRecognizers?.findFirst({ $0 is T }) as? T {
      gesture.addTarget(target, action: #selector(Target.action(_:)))
      return gesture
    } else {
      let gesture = T(target: target, action: #selector(Target.action(_:)))
      view.addGestureRecognizer(gesture)
      return gesture
    }
  }

  public func off(view: UIView, gesture: UIGestureRecognizer) {
    view.removeGestureRecognizer(gesture)
  }
}
