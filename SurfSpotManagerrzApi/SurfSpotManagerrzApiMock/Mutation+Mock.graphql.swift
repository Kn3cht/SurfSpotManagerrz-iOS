// @generated
// This file was automatically generated and should not be edited.

import ApolloTestSupport
import SurfSpotManagerrzApi

public class Mutation: MockObject {
  public static let objectType: Object = SurfSpotManagerrzApi.Objects.Mutation
  public static let _mockFields = MockFields()
  public typealias MockValueCollectionType = Array<Mock<Mutation>>

  public struct MockFields {
    @Field<AuthorizationResponse>("createAccount") public var createAccount
    @Field<SurfSpot>("createOrUpdateSurfSpot") public var createOrUpdateSurfSpot
    @Field<SurfSpotManagerrzApi.ObjectId>("deleteAccount") public var deleteAccount
    @Field<SurfSpotManagerrzApi.ObjectId>("deleteSurfSpot") public var deleteSurfSpot
    @Field<AuthorizationResponse>("login") public var login
  }
}

public extension Mock where O == Mutation {
  convenience init(
    createAccount: Mock<AuthorizationResponse>? = nil,
    createOrUpdateSurfSpot: Mock<SurfSpot>? = nil,
    deleteAccount: SurfSpotManagerrzApi.ObjectId? = nil,
    deleteSurfSpot: SurfSpotManagerrzApi.ObjectId? = nil,
    login: Mock<AuthorizationResponse>? = nil
  ) {
    self.init()
    _setEntity(createAccount, for: \.createAccount)
    _setEntity(createOrUpdateSurfSpot, for: \.createOrUpdateSurfSpot)
    _setScalar(deleteAccount, for: \.deleteAccount)
    _setScalar(deleteSurfSpot, for: \.deleteSurfSpot)
    _setEntity(login, for: \.login)
  }
}
