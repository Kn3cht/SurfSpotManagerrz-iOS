// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateOrUpdateSurfSpotMutation: GraphQLMutation {
  public static let operationName: String = "CreateOrUpdateSurfSpot"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation CreateOrUpdateSurfSpot($surfSpot: SurfSpotInput) { createOrUpdateSurfSpot(surfSpot: $surfSpot) { __typename ...SurfSpotFragment } }"#,
      fragments: [SurfSpotFragment.self, LocationFragment.self, CoordinatesFragment.self]
    ))

  public var surfSpot: GraphQLNullable<SurfSpotInput>

  public init(surfSpot: GraphQLNullable<SurfSpotInput>) {
    self.surfSpot = surfSpot
  }

  public var __variables: Variables? { ["surfSpot": surfSpot] }

  public struct Data: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("createOrUpdateSurfSpot", CreateOrUpdateSurfSpot?.self, arguments: ["surfSpot": .variable("surfSpot")]),
    ] }

    public var createOrUpdateSurfSpot: CreateOrUpdateSurfSpot? { __data["createOrUpdateSurfSpot"] }

    /// CreateOrUpdateSurfSpot
    ///
    /// Parent Type: `SurfSpot`
    public struct CreateOrUpdateSurfSpot: SurfSpotManagerrzApi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.SurfSpot }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .fragment(SurfSpotFragment.self),
      ] }

      public var _id: SurfSpotManagerrzApi.ObjectId { __data["_id"] }
      public var name: String { __data["name"] }
      public var description: String { __data["description"] }
      public var location: Location { __data["location"] }
      public var rating: Int? { __data["rating"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var surfSpotFragment: SurfSpotFragment { _toFragment() }
      }

      /// CreateOrUpdateSurfSpot.Location
      ///
      /// Parent Type: `Location`
      public struct Location: SurfSpotManagerrzApi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Location }

        public var name: String { __data["name"] }
        public var address: String { __data["address"] }
        public var coordinates: Coordinates { __data["coordinates"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var locationFragment: LocationFragment { _toFragment() }
        }

        /// CreateOrUpdateSurfSpot.Location.Coordinates
        ///
        /// Parent Type: `Coordinates`
        public struct Coordinates: SurfSpotManagerrzApi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Coordinates }

          public var lat: Double { __data["lat"] }
          public var lon: Double { __data["lon"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var coordinatesFragment: CoordinatesFragment { _toFragment() }
          }
        }
      }
    }
  }
}
