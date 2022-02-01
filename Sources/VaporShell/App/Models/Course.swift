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
final public class Course : Content{

    public var courseCode : String
    public var semesterLength : String
    private var semester : Int
    public var description : String
    public var location : String
    public var periodBitmap : [[Int]]
    public var level : String
    
    
    // Initialize course data information
    init(courseData: CourseData) throws {
        self.courseCode = courseData.id!
        self.semesterLength = try Self.setSemesterLength(semester: courseData.semesterLength)
        self.semester = try Self.validateSemester(semester: courseData.semester)
        self.description = try Self.validateDescription(description: courseData.description)
        self.location = try Self.validateLocation(location: courseData.location)
        self.periodBitmap = try Self.availabilityAsPeriod(bitmap: courseData.periodBitmap)
        self.level = try Self.validateLevel(level: courseData.level)
    }


    private static func setSemesterLength(semester: String?) throws -> String {
        guard semester == "Dual semester" || semester == "Single semester" else {
            throw Abort(.badRequest, reason: "Expected Single or Dual semester")
        }

        guard let semesterLengthString = semester else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return semesterLengthString 
    }
    
  
    private static func validateSemester(semester: Int?) throws -> Int {
        // Drop the initial "S" from semester (S1, S2)
        guard let semesterInteger = semester,
              (1...2).contains(semesterInteger) else {
            throw Abort(.badRequest, reason: "Cannot convert to Integer")
        }
        
        return semesterInteger
    }
    
    private static func validateDescription(description: String?) throws -> String {
        guard let descriptionString = description else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return descriptionString 
    }
    
    private static func validateLocation(location: String?) throws -> String {
        guard location == "AHS" || location == "CTC" || location == "LFC" || location == "STEAM" else {
            throw Abort(.badRequest, reason: "Expected AHS, LFC, CTC, or STEAM")
        }

        guard let locationString = location else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return locationString 
    }

    
    //returns an array of an array of integer
    //each inner array contains the period(s) that that class is available
    //For example, [[1], [2], [2,3]] indicates a class that is availiale during the first period, second period, and the double blocked vertical 2/3 period
    private static func availabilityAsPeriod(bitmap: Int?) throws -> [[Int]] {

        guard let bitmapInt = bitmap else {
            throw Abort(.badRequest, reason: "Cannot convert to Integer")
        }

        var periods = [[Int]]()
        // Handle all single-period cases (bit 0 ... 10)
        // These bits map directly to the specified period

        for bit in 0 ... 10 {
            if bitmapInt & (1 << bit) != 0 { //make a mask and use AND to make sure that there is a 1 in the right place and then check if the bit is NOT EQUAL to 0 
                let period = bit
                periods.append([period])
            }
        }

        //Handle all vertical, double-blocked periods (bits 11 ... 20)
        //These bits map to period pairs eg. 0/1, 1/2, 2/3, etc.
        for bit in 11 ... 20 {
            if bitmapInt & (1 << bit) != 0 {
                let firstPeriod = bit - 11
                let secondPeriod = firstPeriod + 1
                periods.append([firstPeriod, secondPeriod])
            }
        }

        return periods
    }

    private static func validateLevel(level: String?) throws -> String {
        guard level == "On Level" || level == "Advanced" || level == "AP" || level == "Dual Credit" || level == "Honors (Advanced)" || level == "IB" || level == "Gifted/Talented (Advanced)" || level == "Gifted/Honors (Advanced)" || level == "Gifted/AP (AP)" else {
            throw Abort(.badRequest, reason: "Expected valid level")
        }

        guard let levelString = level else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return levelString 
    }
    
}


