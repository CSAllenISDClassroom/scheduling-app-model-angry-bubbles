import Vapor
import Fluent
import FluentMySQLDriver

/// Provides API Endpoints for accessing ``Employee`` related data
public class CoursesController {

    /// Retrieves the employee record specified by the ID
    ///
    /// * API Endpoint: /employees/{id}
    /// * Method: GET
    /// * Query parameters: None
    /// * Status codes:
    ///   * 200 Successful
    ///   * 400 Bad request
    ///   * 404 Not found
    ///
    /// Returns: ``Employee``
    ///

    
    public func periodToBitmap(period: [Int]) -> Int {
        //var bitmap = 0
        
        var periodBit = 0
        
        if period.count == 1 { // single blocked
            periodBit = 1 << period[0]
        } else if period.count == 2 { // double blocked
            if period[1] == (period[0] + 1) { // vertical
                periodBit = 1 << period[0] + 11
            } else if period[1] == (period[0] + 3) { // horizontal
                periodBit = 1 << period[0] + 21 - 2
            }
        }
        
        return periodBit
    }
    
    public func getCourseByCode(_ app: Application) throws {

        app.get("courses", "filter") { req -> Page<Course> in

            let semester = try? req.query.get(Int.self, at: "semester")
            let location = try? req.query.get(String.self, at: "location")
            let level = try? req.query.get(String.self, at: "level")
            let periodString = try? req.query.get(String.self, at: "period")

            let periodStringArray = periodString!.split(separator: "/")
            var period = [Int]()
            if periodStringArray.count == 1 {
                period.append(Int(periodStringArray[0])!)
            } else if periodStringArray.count == 2 {
                period.append(Int(periodStringArray[0])!)
                period.append(Int(periodStringArray[1])!)
            } 
            
            let courseData = try await CourseData.query(on: req.db)
              .filter(semester == nil ? \.$id != "" : \.$semester == semester!)
              .filter(location == nil ? \.$id != "" : \.$location == location!)
              .filter(level == nil ? \.$id != "" : \.$level == level!)
              .filter(periodString == nil ? \.$id != "" : \.$periodBitmap == self.periodToBitmap(period: period))
              .paginate(for: req)
            
            let courses = try courseData.map{ try Course(courseData: $0) }
            return courses
        }

        app.get("courses", ":code") { req -> Course in
            
            guard let code = req.parameters.get("code", as: String.self) else {
                throw Abort(.badRequest)
            }
            
            guard let courseData = try await CourseData.query(on: req.db)
                    .filter(\.$id == code)
                    .first() else {
                throw Abort(.notFound)
            }

            let course = try Course(courseData: courseData)

            return course
        }

        //EXCEPTIONS
        /*
         app.get("exceptions", "noPeriods") { req -> Page<Course> in
         
         guard let courseData = try await CourseData.query(on: req.db)
         .filter(\.$periodBitmap == [[Int]]()) else {
         throw Abort(.notFound)
         }
         let courses = try paginatedCoursesData.map{ try Course(courseData: $0) }
         return courses
         }
         
         */
        
        app.get("exceptions", "noSemesterLength") { req -> Page<Course> in
            
            let courseData = try await CourseData.query(on: req.db)
              .filter(\.$semesterLength == "")
            
            let paginatedCoursesData = try await courseData.paginate(for: req)
            let courses = try paginatedCoursesData.map{ try Course(courseData: $0) }
            return courses
        }

        app.get("exceptions", "noSubcategories") { req -> Page<Course> in
            
            let courseData = try await CourseData.query(on: req.db)
              .filter(\.$subcategories == "")

            let paginatedCoursesData = try await courseData.paginate(for: req)
            let courses = try paginatedCoursesData.map{ try Course(courseData: $0) }
            return courses
        }
    }
}

