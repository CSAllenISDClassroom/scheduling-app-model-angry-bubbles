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
    public func getCourseByCode(_ app: Application) throws {


        app.get("courses", "filter") { req -> Page<Course> in





            let semester = try? req.query.get(Int.self, at: "semester")
            let location = try? req.query.get(String.self, at: "location")
            let level = try? req.query.get(String.self, at: "level")

            let courseData = try await CourseData.query(on: req.db)
              .filter(semester == nil ? \.$id != "" : \.$semester == semester!)
              .filter(location == nil ? \.$id != "" : \.$location == location!)
              .filter(level == nil ? \.$id != "" : \.$level == level!)
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

    }
}  
