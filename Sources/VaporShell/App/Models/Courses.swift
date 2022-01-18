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
final public class Course: Model, Content{

    let courseData = CourseData()
    private let semester : Int
    private let courseLevel : String
    private let availability : [[Int]]
    
    // Creates a new, empty Employee.
    public init(courseData: CourseData) {
        self.semester = setSemester(semester: courseData.semester)
        self.courseLevel = setCourseLevel(isAP:CourseData.isAP, isIB:CourseData.isIB, isPreAP:CourseData.isPreAP, isOnLevel:CourseData.isOnLevel, isDualCredit: CourseData.isDualCredit)
        
    }

    private func setSemester(semester: String) -> Int {
        return Int(semester.removeFirst())
    }

    /*
    private func setCourseLevel() -> String {
        let courseLevelArray = [CourseData.isOnLevel, CourseData.isDualCredit, CourseData.isPreAP, CourseData.isAP, CourseData.isIB]
        var courseLevelString = ""
        for courseLevel in 0..<courseLevelArray.count {
            if courseLevelArray[courseLevel] == 1 {
                switch courseLevel {
                case 0:
                    courseLevelString = "isOnLevel"
                case 1:
                    courseLevelString = "isDualCredit"
                case 2:
                    courseLevelString = "isPreAP"
                case 3:
                    courseLevelString = "isAP"
                case 4:
                    courseLevelString = "isIB"
                default:
                    courseLevelString = "There was an error retrieving the courseLevel"
                }
            }
        }
        return courseLevelString
    }
    
     */

    func setCourseLevel(isAP:Int, isIB:Int, isPreAP:Int, isOnLevel: Int, isDualCredit: Int) -> String {
        let courseLevelArray = ["isAP" : CourseData.isAP,
                                "isIB" : CourseData.isIB,
                                "isOnLevel" : CourseData.isOnLevel,
                                "isDualCredit" : CourseData.isDualCredit,
                                "isPreAP" : CourseData.isPreAP]
        if courseLevel["isAP"] == 1 {
            return "isAP"
        } else if courseLevel["isIB"] == 1 {
            return "isIB"
        } else if courseLevel["isOnLevel"] == 1 {
            return "isOnLevel"
        } else if courseLevel["isPreAP"] == 1 {
            return "isPreAP"
        } else if courseLevel["isDualCredit"] == 1 {
            return "isDualCredit"
        }
    }

    func setAvailability(availabilityBitmap : Int) -> [[Int]] {
        var periods = [[Int]]()


    }
}


