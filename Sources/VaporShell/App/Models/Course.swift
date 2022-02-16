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

    public var dualCreditDailySchedule : String
    
    public var courseCode : String
    public var semesterLength : String
    public var semester : Int
    public var description : String
    public var location : String
    public var periodBitmap : [[Int]]
    public var level : String
    public var categories : String
    public var subcategories : String
    
    // Initialize course data information
    init(courseData: CourseData) throws {
        self.dualCreditDailySchedule = try Self.validateDCSchedule(schedule: courseData.dualCreditDailySchedule )
        
        self.courseCode = courseData.id!
        self.semesterLength = try Self.setSemesterLength(semester: courseData.semesterLength)
        self.semester = try Self.validateSemester(semester: courseData.semester)
        self.description = try Self.validateDescription(description: courseData.description)
        self.location = try Self.validateLocation(location: courseData.location)
        self.periodBitmap = try Self.availabilityAsPeriod(bitmap: courseData.periodBitmap)
        self.level = try Self.validateLevel(level: courseData.level)
        self.categories = try Self.validateCategory(category: courseData.categories)
        self.subcategories = try Self.validateSubcategory(subcategory: courseData.subcategories)
    }

    private static func validateDCSchedule(schedule: String?) throws -> String {
        guard schedule == "TR" || schedule == "MWF" || schedule == "MTWRF" else {
            return "NULL"
        }

        guard let stringSchedule = schedule else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }
        
        return stringSchedule
    }
    
    private static func setSemesterLength(semester: String?) throws -> String {
        guard semester == "Dual semester" || semester == "Single semester" else {
            return ""
        }

        guard let semesterLengthString = semester else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return semesterLengthString 
    }
    
  
    private static func validateSemester(semester: Int?) throws -> Int {
        
        guard let semesterInteger = semester
        else { //,(1...2).contains(semesterInteger) else {
            return -1
        }
        
        return semesterInteger
    }
    
    private static func validateDescription(description: String?) throws -> String {
        guard let descriptionString = description else {
            return "No description provided"
        }
        
        return descriptionString 
    }
    
    private static func validateLocation(location: String?) throws -> String {
        guard location == "AHS" || location == "CTC" || location == "LFC" || location == "STEAM" else {
            return "Null"
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

        //Handle all horizontal, double-blocked periods (bits 21 ... 23)
        //These bits map to period pairs eg. 2/5, 3/6, 4/7, etc.
        for bit in 21 ... 23 {
            if bitmapInt & (1 << bit) != 0 {
                let firstPeriod = bit - 21
                let secondPeriod = firstPeriod + 3
                periods.append([firstPeriod, secondPeriod])
            }
        }  
        
        return periods
    }

    private static func validateLevel(level: String?) throws -> String {
        guard level == "On Level" || level == "Advanced" || level == "AP" || level == "Dual Credit" || level == "Honors (Advanced)" || level == "IB" || level == "Gifted/Talented (Advanced)" || level == "Gifted/Honors (Advanced)" || level == "Gifted/AP (AP)" else {
            return "Null"
            //throw Abort(.badRequest, reason: "Expected valid level")
        }

        guard let levelString = level else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return levelString 
    }

     private static func validateCategory(category: String?) throws -> String {
         guard category == "Business & Industry" || category == "Business & Industry,Business & Industry" || category == "Core,Business & Industry" || category == "Arts & Humanities" || category == "Business & Industry,Business & Industry,Business & Industry" || category == "Specialty Electives" || category == "Arts & Humanities,Arts & Humanities" || category == "Public Service" || category == "Public Service,Business & Industry" || category == "Public Service,Core" || category == "Core" || category == "Core,Core" || category == "Specialty Electives,Specialty Electives" || category == "Core,Arts & Humanities" || category == "STEM,Business & Industry" || category == "STEM,STEM" || category == "STEM" else {
            return "Null"
        }

        guard let categoryString = category else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return categoryString  
     }

     private static func validateSubcategory(subcategory: String?) throws -> String {
         guard subcategory == "Agriculture, Food & Natural Resources" || subcategory == "Agriculture, Food & Natural Resources,Agriculture, Food & Natural Resources" || subcategory == "Math,Agriculture, Food & Natural Resources" || subcategory == "Band" || subcategory == "Choir" || subcategory == "Orchestra" || subcategory == "Finance" || subcategory == "Marketing" || subcategory == "Finance,Business Management & Administration" || subcategory == "Math,Finance" || subcategory == "Business Management & Administration" || subcategory == "Finance,Business Management & Administration,Marketing" || subcategory == "Journalism" || subcategory == "Specialty Electives" || subcategory == "Theatre" || subcategory == "Fine Arts Theory/History" || subcategory == "Visual Arts" || subcategory == "Theatre,Theatre" || subcategory == "Hospitality & Tourism" || subcategory == "Education & Training" || subcategory == "LOTE" || subcategory == "Health Science,Business Management & Administration" || subcategory == "Health Science" || subcategory == "Health Science,Science" || subcategory == "Science" || subcategory == "LOTE,LOTE" || subcategory == "Arts, Audio/Video Technology & Communication" || subcategory == "English" || subcategory == "Law, Public Safety, Corrections & Security,Science" || subcategory == "Law, Public Safety, Corrections & Security" || subcategory == "Math" || subcategory == "Health & Physical Education" || subcategory == "Athletics,Athletics" || subcategory == "Specialty Electives,Specialty Electives" || subcategory == "Social Studies" || subcategory == "Social Studies,Social Studies Electives" || subcategory == "Architecture & Construction" || subcategory == "Engineering,Information Technology" || subcategory == "Computer Science,Engineering" || subcategory == "Information Technology" || subcategory == "Engineering" else {
             return "Null"
         }
         guard let subcategoryString = subcategory else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return subcategoryString  
     
}


}
