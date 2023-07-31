// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class User: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.User
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<User>>

  public struct MockFields {
    @Field<SurfSpotManagerrzApi.ObjectId>("_id") public var _id
    @Field<String>("email") public var email
    @Field<String>("username") public var username
  }
}

public extension Mock where O == User {
  convenience init(
    _id: SurfSpotManagerrzApi.ObjectId? = nil,
    email: String? = nil,
    username: String? = nil
  ) {
    self.init()
    _setScalar(_id, for: \._id)
    _setScalar(email, for: \.email)
    _setScalar(username, for: \.username)
  }
}
