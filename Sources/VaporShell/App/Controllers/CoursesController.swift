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
        /*
        app.get("courses", "filter", ":filterString") { req -> Page<Course> in
            
            var arrayFilters = [String]()
            
            guard let filterString = req.parameters.get("filterString", as: String.self) else {
                //TODO: ADD ERROR MESSAGE SPECIFYING THAT FILTERSTRING IS NOT STRING
                throw Abort(.badRequest)
            }

// SOON TO BE DEPRECATED CODE BECAUSE FUNCTION WILL BE USED INSTEAD
            for charIndex in filterString {
                if filterStringCount[charIndex] == "=" {
                    
                }
            }

            //equal sign number is the equal sign you want to find i.e. if you want to find the third equal sign, put 3
            func findEqualSignIndex(equalSignNumber: Int, filterString: String) -> Int {
                var equalSignsFound = 0
                for charIndex in filterString.count {
                    if filterString[charIndex] == "=" {
                        if equalSignsFound == equalSignNumber - 1 {
                            return charIndex
                        } 
                    }
                }
            }
            
            /*
            let semester = req.parameters.get("semester")
            let semesterCourses = try await CourseData.query(on: req.db)
              .filter(\CourseData.semester == semester)
              .paginate(for: req)
            let courses = try courseData.map{ try Course(courseData: $0) }
            
             */
            return courses
        }
        
         */

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
