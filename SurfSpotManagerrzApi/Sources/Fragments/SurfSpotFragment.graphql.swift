// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct SurfSpotFragment: SurfSpotManagerrzApi.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString {
    "fragment SurfSpotFragment on SurfSpot { __typename _id name description location { __typename ...LocationFragment } }"
  }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.SurfSpot }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("_id", SurfSpotManagerrzApi.ObjectId.self),
    .field("name", String.self),
    .field("description", String.self),
    .field("location", Location.self),
  ] }

  public var _id: SurfSpotManagerrzApi.ObjectId { __data["_id"] }
  public var name: String { __data["name"] }
  public var description: String { __data["description"] }
  public var location: Location { __data["location"] }

  /// Location
  ///
  /// Parent Type: `Location`
  public struct Location: SurfSpotManagerrzApi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { SurfSpotManagerrzApi.Objects.Location }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .fragment(LocationFragment.self),
    ] }

    public var name: String { __data["name"] }
    public var address: String { __data["address"] }
    public var coordinates: Coordinates { __data["coordinates"] }

    public struct Fragments: FragmentContainer {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public var locationFragment: LocationFragment { _toFragment() }
    }

    /// Location.Coordinates
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
