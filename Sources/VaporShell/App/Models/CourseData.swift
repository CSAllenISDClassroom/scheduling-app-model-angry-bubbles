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

// This class provides the model for a Course
final public class CourseData: Model{
    // Name of the table or collection.
    public static let schema = "Courses"

    // Unique identifier for Courses.
    @ID(custom: "courseCode", generatedBy: .user)
    public var id: String?

    @Field(key: "semesterLength")
    public var semesterLength: String

    @Field(key: "semester")
    public var semester: String

    // Short Description of the course
    @Field(key: "shortDescription")
    public var shortDescription: String

    @Field(key: "description")
    public var description: String

    @Field(key: "dualCreditDailySchedule")
    public var dualCreditDailySchedule: String
    
    @Field(key: "location")
    public var location: String

    @Field(key: "periodBitmap")
    public var periodBitmap: Int

    
    // Creates a new, empty Courses.
    public init() { }
}

