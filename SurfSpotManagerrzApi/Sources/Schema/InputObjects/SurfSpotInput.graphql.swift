// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct SurfSpotInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    _id: GraphQLNullable<ObjectId> = nil,
    name: String,
    description: String,
    location: LocationInput
  ) {
    __data = InputDict([
      "_id": _id,
      "name": name,
      "description": description,
      "location": location
    ])
  }

  public var _id: GraphQLNullable<ObjectId> {
    get { __data["_id"] }
    set { __data["_id"] = newValue }
  }

  public var name: String {
    get { __data["name"] }
    set { __data["name"] = newValue }
  }

  public var description: String {
    get { __data["description"] }
    set { __data["description"] = newValue }
  }

  public var location: LocationInput {
    get { __data["location"] }
    set { __data["location"] = newValue }
  }
}
