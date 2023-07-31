// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class Coordinates: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.Coordinates
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Coordinates>>

  public struct MockFields {
    @Field<Double>("lat") public var lat
    @Field<Double>("lon") public var lon
  }
}

public extension Mock where O == Coordinates {
  convenience init(
    lat: Double? = nil,
    lon: Double? = nil
  ) {
    self.init()
    _setScalar(lat, for: \.lat)
    _setScalar(lon, for: \.lon)
  }
}
