/*
VaporShell provides a minimal framework for starting Igis projects.
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
// UNCOMMENT-DATABASE to configure database example
import Fluent
import FluentMySQLDriver

let coursesController = CoursesController()

func routes(_ app: Application) throws {
    
    app.get { req in
        return "It works!"
    }

    // UNCOMMENT-DATABASE to configure database example
    // Find an employee with the specified ID
    try coursesController.getCourseByCode(app)

    /// This API endpoint provides a list of all employees
    /// Paging is supported
    /// Endpoint URI: /employees
    app.get("courses") { req -> Page<Course>  in
        let courseData = try await CourseData.query(on: req.db)
          .paginate(for: req)
        let courses = try courseData.map{ try Course(courseData: $0) }
        return courses
    }

    app.get("categories") {
        req -> Page<Category>  in
        let categoriesData = try await CategoriesData.query(on: req.db)
          .paginate(for: req)
        let categories = try categoriesData.map{ try Category(categoriesData: $0) }
        return categories
    }

    app.get("subcategories") {
        req -> Page<Subcategory>  in
        let subcategoriesData = try await SubcategoriesData.query(on: req.db)
          .paginate(for: req)
        let subcategories = try subcategoriesData.map{ try Subcategory(subcategoriesData: $0) }
        return subcategories
    }
}
