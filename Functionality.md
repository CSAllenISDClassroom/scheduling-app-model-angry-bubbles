# 1. List of Courses

## Functionality
Every possible course will be listed initially, but a search engine will be available to make accessibility of courses more easier by the user. The search engine will receive user input and compare it with the list of courses to filter by keyword. Furthermore, the search engine will also be assisted by filters to further narrow down the list of courses to ones that the user desires. Possible filters to narrow down selections include subject, period, location, GPA, prerequisites, and grade requirements.

## Design
The list of courses will be displayed across multiple pages and the number of courses displayed on each page could be determined by the user. As courses are viewed by the user and selected, rudimentary course information will be accessed through the database and mirroring information.

## QA
The list of courses will be verified by ensuring every existing course appears on the list in addition to ensuring that the search engine and filters correctly isolate courses by keyword and other respective categories.

# 2. Model Schedule

## Functionality
The model schedule is an empty schedule on the screen that has empty slots for each period. The term "Model Schedule" refers to the user interface displayed on the screen. The user interface for this should look like the interface for the empty schedule in the scheduler app last year (2020-2021). Courses can be dragged into and out of the slots on the model schedule. It will have spots for each period (0-8), but the 0, 1, and 8 period spots will be there for both A days and B days. Furthermore, there will be a a second interface for the second semester, to account for semester long classes.

## Design
The model schedule will be class consisting of an array of 9 courses (to represent each period). This array will initially be empty. The index number corresponds to a period (index 0 is period 0, index 8 is period 8, etc.). As the user puts courses into their model schedule, this array will update and have a course in the period that the user specified. Each time a new course is put into the model schedule, there should be a check to make sure that the user isn't putting a course not available in that period (i.e. if physics is only available period 6 and period 3, and the user is attempting to place physics in period 2). If the check fails, then a warning message should pop up above the model schedule explaining that the user is attempting to place a course in a period that is invalid. There should be 2 model schedule classes for each year, one for the fall semester and one for the spring semester. When the user is finished, they will click on a "complete schedule" button. Upon clicking this, there should be a check to ensure that there are no class time conflicts, travel issues, or school time issues (the schedule should fulfill the minimum minutes per day requirement).

## QA
The model schedule will be tested by ensuring that courses assigned by the user to its respective periods are updated in the user database as the user desires. Warnings should also appear and prevent the user from proceeding only if the combination of courses are truly invalid so that there are no false alarms or invalid schedules being marked as valid.

# 3. Inputting Courses into Schedule

## Functionality 
what it is 
provides the list of courses from the database and allows user to click on them to select them.
Has a search bar to search for key words. The key words are used to sort through the list of all the classes. 
stores the selected courses in the user's list of selected courses. The user can use the list of selected courses to 
drag and drop them in the model schedule.

## Design 
There would be a data structure for the selected courses: a list because it doesn't need to be ordered. There would be a data structure for the schedule and that would be an array because it is ordered, and the indexes in the array would fit the class schedule (zero index -> zero period). It would be an optional array for class type course as there is the possibilty that a student does not have classes in certain periods such as zero period. Once they select a course from their selected courses, it will remove it from the list and copy it into the array. If they want to tske a class off the schedule, then they would have to click and drag it back: making the value in the array nil and adding it back into the list.

## QA 
User is able to put courses into the schedule and courses that have conflicts with other classes will be stopped. And only courses selected by the user will be displayed. Make sure that the courses will not disappear once another course has been selected for a fifth period. Their data should also be saved if they navigate away from the page.

# 4. Print/Email Schedule

## Functionality
After creating a valid schedule, a user canopt to send a PDF version of the finalized schedule to a printer or a designated email address. The use can click one of the two sepaarate buttons for printing/emailing the schedule. The printer button should lead the uer to the printing interface that is used by the computer they are on, and it is pre-set to print a PDF of the schedule and the can make any changes to the printer settings and print the schedule. The emailing Button leads them to their Gmail acccount, if they are logged in the schedule is attached to an email and the user can input the email adress they want to send the schedule to. 

Alternate Emailing option : After the user clicks the email button, they are able to input an email adress that the schedule will be sent to. The scheduling app sends an email with the PDF to the email specified. If it is unable to send , the schduling app displays a text box to the user that states  the schedule failed to be sent because the email adress was invalid. 

## Design

*Usage of APIs for printing and emailing 

1) Printing

* If print button is clicked 
> Could trigger the use of an API
* Convert current schedule to PDF Format
* Send PDF to the computer's printer interface
* From this point forward the user can print as desired

2) Emailing

* If email button is clicked 
> Could trigger the use of an API
* Convert current schedule to PDF Format
* If signed into an email, the PDF would be attached in a new draft
* From this point forward the user can deignate someone to send to or edit the email as desired 

## QA
The printing and emailing feature will be tested by ensuring that the created schedule can be converted to a table in the PDF format and can be sent to a local network printer or to an email. To ensure that the final schedule is successfully converting into a pdf with the use of the print button, the user can create a schedule and click the button that allows them to download it as a PDF. If a PDF is downloaded to the desktop and successfuly opens rendering the PDF version of the schedule, the PDF button is successfully working.


# 1. Help Ticket

## Functionality
The help ticket will be featured as a way for users to ask any questions or issues they may encounter when creating a schedule. The help ticket will have various questions to narrow down the issue or question for a counselor to easily and quickly respond to the requests.

## Design
The help ticket button is a button that will be located at the bottom left of the screen in the scheduler. This button will send them to a google form once it is selected. This google form will allow them to input their problem into a textbox. This can be submitted which will send out the inquiry within the textbox to a proper email. Depending on what we use to create the front end, we will use the appropiate language and create a button that holds the link to the help ticket google form. The button will be placed at the end of the navbar to be easily accesible. It will be labeled "NEED HELP?".

## QA
We will ensure the the button leads to the correct google form link and properly sends a user's request to a counselor or guidance figure. Furthermore, the help ticket button must be accessible from all pages. When the button is clicked, make sure that it links to the correct Google form. Make sure that the button is visible for those that need help.

# 3. Warning upon creation of invalid schedule

## Functionality
When the user is creating their schedule by placing their classes in different class periods into the model 
scheduler, if a class is placed where there is a conflict there will be red text at the top of the screen that
notifies the user that there is a conflict in the schedule, and the user will not be able to place courses in their schedule
until the conflict is resolved.\
 some conflicts include but are not limitted to: \
 invalid privellage period 
 not enough courses/minutes 
 overlapping classes 
 campus conflicts 
 
## Design
It would have multiple checks before they can proceed to the final section where they print/submit their schedule. These checks would include making sure they have enough academic minutes for A day and B day, making sure STEAM and Dual Credit classes don't overlap, making sure that priviledge period is not during 3rd or 6th period, and that not more than 3 privledge periods are selected. And making sure that they have at least one privledge period and one extra if they have a zero period. Functions for checking a schedule for its validity.

## QA
Quality assurance for this feature would come from the user being notified if there is a conflict with the placement of their courses in a specific place in their schedule via the red text that would pop to alert them as well as a function that would prevent them from adding that course to their schedule in the first place.
# 2. Bug Report

## Functionality
The bug report function: There's a button that users can click on to report a bug. Upon clicking the button, they're brought to a new page. On the page there will be 3 text boxes. In one they'll state how they got to the bug. In another text box they'll explain what the problem that they're experiencing is. In the 3rd text box, they'll leave their email if we may need to contact them for further information or if their bug was handled or not.

## Design
The bug report button will lead to a google form where users can report bugs. The front end will program a button with the link to our bugs google form.

## QA
Make sure the button is available in the correct location and it leads to the correct google form. 

# 3. Link to Resources

## Functionality
Page that includes a list of resources for arena scheduling. This includes (but is not limited to) FAQ, Course descriptions in the Academic Planning Guide, Counslors webpage, Arena Scheduling Help Ticket. This is located in the navigation bar at the vary end and includes a list of resources to all the pages.
	
## Design
There would be a dictionary where the key is the name of the resource and the value is the resource itself which will be linked on the website.

## QA
The links to the resource offered would have to be verified in order to make sure that they take the users to their intended resource location. 

# 4. Notification for special classes (band, soccer, etc.)

## Functionality
If the user selects a'special' course, designated based on potiential conflicts that it may have, (campus conflicts - steam, CTC, AHS and LFC,timings for the course start early or stay late,extracurriculars like band,sports and orchestra)
an alert is given notifying the user that the class could cause scheduling conflicts. The course title would be changed from it's initial color to red, and descriptive text would appear providing more information regarding the conflict. 

## Design
1) User selects a class
2) If said class is a predetermined 'special class' [designated as such due to possible scheduling conflicts] change change color of text of class to red
* Special classes will be indicated by a variable inside the object of the course, set to True or False
* True indicates a special coyrse, while False indicates a regular one
* Special courses would include STEAM / Lowery / Transportation-needed courses, Sports, Early/Late courses, band, etc
* The program would check if the indicator is False or True before notifying the user about the special class
3) Show descriptive text regarding the conflict
* For example, for a late course, text would show regarding the fact that the course would last longer than a regular Allen high school course duration 
> "Note: This course runs past the regular course duration"
* Other possible warnings
> "Note: This course is at an alternate location, which may cause scheduling issues"
> "Note: This course runs on a different schedule [Dual credit, STEAM, etc] which may cause scheduling issues"
> "Note: This course requires you to arrive earlier in the morning than an average 0/1st period course"
* This small note will persist during scheduling as a reminder of the course's status

## QA
When the user selects any course from the list that has been predetermined to be a 'special' class, if the course they selected changes its initial color to red and the descriptive text appears the Notification is successful. This process should be repeated and tested for every special course to determine if the notifications are working and displaying properly; If not, debugging or fixing code will probably be neccessary. 
Also, we need to determine that these notifications are specific to special courses solely, not normal courses, so some normal courses should be included while testing. 

# 1. Elaborated Course Description

## Functionality
User request will be received and information pertaining to a course that the user specified will be displayed to the user. Displayed information may elaborate beyond its name by including available periods, locations, subject type, and level of rigor. If necessary, external links and forms can be included for courses with special prerequisites.

## Design
When a user requests further information on a course, a pop up window will be displayed so that the user information can be read alongside other courses and the model scheduler.

## QA
The information pop up window will have to be checked and ensured to be accurate to the school's definitions of the course description.

# 2. Filter for Courses

## Functionality
Users will be able to open a dropdown menu, next to the search bar, in which there will be the following terms: Math, English, Science, Social Studies, Fine arts, Athletics, Electives, AP, Advanced, On-level, Steam, Dual Credit, Filter by difficulty, and filter by periods.

## Design
String Course Difficulty
The difficulty would be a changing property in the courses like IB, AP, Adv., and On-level.

let Period = [0, 1, 2, 3, 4, 5, 6, 7, 8]
Filters the periods through an array for every type of class.

## QA
Filters will be checked by ensuring that the correct courses appear based off of the chosen category with the correct information and names of courses shown.

# Landing Page
## Functionality
There will be functionality for the users to specify which grade level they are in to streamline their course selction process.

## Design


## QA


# 3 Step Process for Scheduling

## Functionality
1. First step: The first step would allow users to select their courses from a list of all available courses. There will be a limit of twenty courses.The screen will be split up into sections with the left section, titled "Available Courses", containing a list of all available course with a search bar to locate courses with a filter to specify and the right section, titled "Selected Courses", containing the user selected courses. The course name itself will be shown on the left and the code will be shown on the right. There will be an icon available at the top of each section to provide information to the user upon being hovered over. The information will consist of details about what each section is about and how and what they should be doing in each section.
2. Second step: The second step involves the process of selecting course for the Fall Semester for the AHS, LFC, and Steam Center campuses. There are also two sections with one section being the bell schedule for the AHS/LFC campuses on the left with the Steam Center on the right section. The user is able to attempt multiple times to insert their selected courses from the first step into specific periods dependent on the periods that a specifc course will be offered. The user will also have the ability to switch between viewing a A day alone and a B day alone to make their scheduling period more facile.This step also includes inputting courses into the Spring semester of their upcoming school year with the same functionality offered as the Fall semster.
3.Third Step: The third step involved Reviewing the finished schedule for the user. The user will be able to view all of their courses in their specificed periods on their schedule. They will be provided the option to create another alternate scheudle as well if they choose to have another version. A significant functionality, which is also another feature, that is offered within this step would be the user's ability to save/export their schedule(s) that they have made.
## Design
1. First Step: During the selection process itself, the user would have the option of hovering over the course name to get a pop up with information. The left section retreives the courses from the database and narrows it down by the search or the filter specified by the user. On the right section, there would be an array of all the seleted courses and the array would be appended to as the user selects each course. The help icon will be in the top right of each section and it will display information if the webpage detects that the user is hovering over the icon. 
2. Second Step: The now has created an array of possible courses out of their selections in the first step. As a result, they will be able to use the values in that array to create a new schedule by mapping their specific course values to the periods within their schedules which would act the keys in a dictionary as they would be creating values to fill out their schedule. Apart from the potential data structures for this feature, there will also be a button for the users to hover and click to change their schedule to show only A day periods or B day periods. 
3. third Step: the review step would have a completed schedule for the users to view and decide if they want to keep their schedule or discard it to start over. It will also include an option to make another alternate schedule while keeping the schedule(s) that the user has already made. If the user wishes to end their scheduling process,then they will be presented with a screen that has them save, print, or export their schedules.
## QA
For each step, there will be a series of checks done to ensure that the user is completing their schedule with the correct amount of courses 

# Navigation Bar

## Functionality 
A navigation bar will allow users to access easily access resources and tools for interfacing with the schedule builder. It serves as a way to organize items into tabs or categories for ease of access. As a result, users will be able to navigate between the module scheduler and list of courses for selection of courses without losing user information.

## Design

The navigation bar could be reperesented using a class that has three seperate functions that render the objects that make up each of the three pages. Each of the three functions repond to the click of the user's mouse by calling the function associated with the button clicked. 
Multiple tabs will be displayed at the top of the page and each tab will act as a category to incorporate features with similar characteristics or related functions.

## QA 
The navigation bar will be tested by insuring that the tabs and feature tabs lead to the correct page or resource requested by the user.

# Create Alternate Schedule

## Functionality
In addition to the main model schedule created by the user, the user will have the option to create a secondary, or backup schedule in the situation where course slots for one or all periods run out. When creating the alternate schedule, the main schedule can be copied over for modification and swapping of courses into different periods.

## Design
The design will mirror that of the model scheduler of the main schedule, but courses or periods will be marked as alternates to distinguish with the main schedule.

## QA
The alternate schedule will be tested by ensuring that it is separate from the main schedule with the placement of courses not encountering time conflicts.

# Saving Schedules Made
## Functionality
Once a valid schedule is constructed by the user, the user will be given the choice to save and store it for later reference and viewing.

## Design
Saving schedules will be done by storing the completed schedules in the database, identified by an id. The user will have access by signing into an account in a login page and a list of stored schedules will be shown to the user if any saved schedules are available for viewing.

## QA
The saving of schedules will be test by ensuring user data remains the same as long as it is saved, is separate from other user's schedules, and by ensuring continued access until the user would like to delete the schedule.

# Select A/B Day 
## Functionality
There will be an option to assign courses on an A day and B day with time intervals of periods taken into consideration for the user to consider when creating a schedule.
## Design
Two separate columns will exist to distinguish A days and B days on the model schedule.
## QA
The A day and B day selection will be tested by ensuring periods 2, 3, and 4 are on A days and that periods 5, 7, and 7 are on B days with proper time intervals depending on the course.
