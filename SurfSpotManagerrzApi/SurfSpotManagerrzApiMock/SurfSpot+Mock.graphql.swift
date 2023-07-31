// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class SurfSpot: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.SurfSpot
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<SurfSpot>>

  public struct MockFields {
    @Field<SurfSpotManagerrzApi.ObjectId>("_id") public var _id
    @Field<Coordinates>("coordinates") public var coordinates
    @Field<String>("description") public var description
    @Field<String>("name") public var name
  }
}

public extension Mock where O == SurfSpot {
  convenience init(
    _id: SurfSpotManagerrzApi.ObjectId? = nil,
    coordinates: Mock<Coordinates>? = nil,
    description: String? = nil,
    name: String? = nil
  ) {
    self.init()
    _setScalar(_id, for: \._id)
    _setEntity(coordinates, for: \.coordinates)
    _setScalar(description, for: \.description)
    _setScalar(name, for: \.name)
  }
}
