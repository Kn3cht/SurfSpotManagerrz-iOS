// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class Query: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.Query
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Query>>

  public struct MockFields {
    @Field<User>("findCurrentUser") public var findCurrentUser
    @Field<[SurfSpot?]>("listSurfSpots") public var listSurfSpots
  }
}

public extension Mock where O == Query {
  convenience init(
    findCurrentUser: Mock<User>? = nil,
    listSurfSpots: [Mock<SurfSpot>?]? = nil
  ) {
    self.init()
    _setEntity(findCurrentUser, for: \.findCurrentUser)
    _setList(listSurfSpots, for: \.listSurfSpots)
  }
}
