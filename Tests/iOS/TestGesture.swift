import UIKit
import XCTest
import Sugar

class GestureTests: XCTestCase {

  func testGesture() {
    let sense = GestureSense()
    let view = UIView()

    sense.tap(view) { gr in
      
    }

    sense.pan(view) { gr in

    }

    sense.pan(view) { gr in

    }

    XCTAssertEqual(sense.targets.count, 3)
    XCTAssertEqual(view.gestureRecognizers?.count, 2)
  }
}
