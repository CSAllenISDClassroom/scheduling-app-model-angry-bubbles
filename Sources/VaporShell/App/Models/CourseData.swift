/*
VaporShell provides a minimal framework for starting Vapor projects.
Copyright (C) 2021, 2022 CoderMerlin.com
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for an Course
final public class CourseData: Model{
    // Name of the table or collection.
    public static let schema = "CourseSectionsView"

    /// Unique identifier for this Employee.
    @ID(custom: "code", generatedBy: .user)
    public var id: String?
    
    /// Short Description of the course
    @Field(key: "shortDescription")
    public var shortDescription: String

    @Field(key: "description")
    public var description: String

    @Field(key: "locationName")
    public var location: String

    @Field(key: "isApplication")
    public var isApplication: Int

    @Field(key: "isAP")
    public var isAP: Int

    @Field(key: "isIB")
    public var isIB: Int

    @Field(key: "isPreAP")
    public var isPreAP: Int

    @Field(key: "isDualCredit")
    public var isDualCredit: Int

    @Field(key: "isOnLevel")
    public var isOnLevel: Int

    @Field(key: "semester")
    public var semester: String

    @Field(key: "availabilityBitmap")
    public var availabilityBitmap: Int

    
    // Creates a new, empty Employee.
    public init() { }
}

