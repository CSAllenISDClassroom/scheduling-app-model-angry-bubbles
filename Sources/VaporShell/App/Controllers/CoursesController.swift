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
        app.get("courses") { req -> Page<Course> in
            let coursesData = try await CourseData.query(on: req.db)
              .paginate(for: req)
            let courses = try coursesData.map{ try Course(courseData : $0) }
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
