// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class Mutation: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.Mutation
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mutation>>

  public struct MockFields {
    @Field<CreateAccountResponse>("createAccount") public var createAccount
    @Field<String>("login") public var login
  }
}

public extension Mock where O == Mutation {
  convenience init(
    createAccount: Mock<CreateAccountResponse>? = nil,
    login: String? = nil
  ) {
    self.init()
    _setEntity(createAccount, for: \.createAccount)
    _setScalar(login, for: \.login)
  }
}
