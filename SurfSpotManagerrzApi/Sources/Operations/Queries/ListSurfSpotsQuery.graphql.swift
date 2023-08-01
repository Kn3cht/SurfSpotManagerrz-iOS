// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ListSurfSpotsQuery: GraphQLQuery {
  public static let operationName: String = "ListSurfSpots"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ListSurfSpots { listSurfSpots { __typename ...SurfSpotFragment } }"#,
      fragments: [SurfSpotFragment.self, LocationFragment.self, CoordinatesFragment.self]
    ))

  public init() {}

  public struct Data: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("listSurfSpots", [ListSurfSpot?]?.self),
    ] }

    public var listSurfSpots: [ListSurfSpot?]? { __data["listSurfSpots"] }

    /// ListSurfSpot
    ///
    /// Parent Type: `SurfSpot`
    public struct ListSurfSpot: SurfSpotManagerrzApi.SelectionSet {
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

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var surfSpotFragment: SurfSpotFragment { _toFragment() }
      }

      /// ListSurfSpot.Location
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

        /// ListSurfSpot.Location.Coordinates
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
