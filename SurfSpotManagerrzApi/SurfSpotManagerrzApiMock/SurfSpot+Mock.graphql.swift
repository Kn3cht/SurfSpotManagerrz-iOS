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
    @Field<String>("description") public var description
    @Field<Location>("location") public var location
    @Field<String>("name") public var name
    @Field<Int>("rating") public var rating
  }
}

public extension Mock where O == SurfSpot {
  convenience init(
    _id: SurfSpotManagerrzApi.ObjectId? = nil,
    description: String? = nil,
    location: Mock<Location>? = nil,
    name: String? = nil,
    rating: Int? = nil
  ) {
    self.init()
    _setScalar(_id, for: \._id)
    _setScalar(description, for: \.description)
    _setEntity(location, for: \.location)
    _setScalar(name, for: \.name)
    _setScalar(rating, for: \.rating)
  }
}
