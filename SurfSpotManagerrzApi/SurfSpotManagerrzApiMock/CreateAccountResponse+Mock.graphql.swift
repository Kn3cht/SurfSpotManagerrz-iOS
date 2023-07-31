// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class CreateAccountResponse: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.CreateAccountResponse
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<CreateAccountResponse>>

  public struct MockFields {
    @Field<String>("token") public var token
    @Field<User>("user") public var user
  }
}

public extension Mock where O == CreateAccountResponse {
  convenience init(
    token: String? = nil,
    user: Mock<User>? = nil
  ) {
    self.init()
    _setScalar(token, for: \.token)
    _setEntity(user, for: \.user)
  }
}
