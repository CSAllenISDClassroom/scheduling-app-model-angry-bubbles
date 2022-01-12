/*
API 1: SEARCH QUERY
Used in response to the user typing in the search bar in page 1 of the scheduler app
 */

//app.get
// Used after the user types a character in the search bar
// - Parameters:
// Accepts the input from the user as a string
// - Returns:
// Returns an array of CourseLongNameCells to display in the table using an SQL Query


/*
API 2: SELECTING COURSES
Used in response to the user selecting a course in the course selection page
 */

//app.post - Not sure whether this is post, patch, or get
// Used after the user selects a course for use in the schedule
// - Parameters:
// Reads the course id of the selected course
// - Returns:
// creates a visual object in another column, visually demonstrating that the user has selected this course for use in their schedule


/*
API 3: PLACING COURSES IN SCHEDULE
Used in response to the user placing courses in the schedule
 */

//app.put - Not sure whether this is put, patch, or get
// Used after the user selects a course and places it in the model schedule
// - Parameters:
// Reads the course id of intended course and position of the schedule (which class period)
// - Returns:
// creates a visual object: it displays the correct formatting of the class based on campus and it also displays the appropriate class times based on campus


/*
API 4: REMOVING COURSES FROM SCHEDULE
Used in response to the user removing courses in the schedule
 */

//app.delete
// Used after the user removes a course from the model schedule
// - Parameters:
// Reads the course id and position of the course in the schedule (class period)
// - Returns:
// Reformats the model schedule to visually demonstrate that the course has been removed
