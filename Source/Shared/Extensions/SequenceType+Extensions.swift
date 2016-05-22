import Foundation

public extension SequenceType {

  /**
   Find first element in collection matching a condition

   - parameter predicate: The condition

   - returns: matched element, nil otherwise
   */
  public func findFirst(@noescape predicate: Self.Generator.Element -> Bool) -> Self.Generator.Element? {
    for element in self {
      if predicate(element) {
        return element
      }
    }

    return nil
  }
}
