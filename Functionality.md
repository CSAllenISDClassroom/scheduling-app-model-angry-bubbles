# 1. List of Courses

## Functionality
Every possible course will be listed initially, but a search engine will be available to make accessibility of courses more easier by the user. The search engine will receive user input and compare it with the list of courses to filter by keyword. Furthermore, the search engine will also be assisted by filters to further narrow down the list of courses to ones that the user desires. Possible filters to narrow down selections include subject, period, location, GPA, prerequisites, and grade requirements.
## Design

## QA

# 2. Model Schedule

## Functionality
The model schedule is an empty schedule on the screen that has empty slots for each period. The term "Model Schedule" refers to the user interface displayed on the screen. The user interface for this should look like the interface for the empty schedule in the scheduler app last year (2020-2021). Courses can be dragged into and out of the slots on the model schedule. It will have spots for each period (0-8), but the 0, 1, and 8 period spots will be there for both A days and B days. Furthermore, there will be a a second interface for the second semester, to account for semester long classes.

## Design

## QA

# 3. Inputting Courses into Schedule

## Functionality 
what it is 
provides the list of courses from the database and allows user to click on them to select them.
Has a search bar to search for key words. The key words are used to sort through the list of all the classes. 
stores the selected courses in the user's list of selected courses. The user can use the list of selected courses to 
put them in the model schedule.

## Design 
There would be a data structure for the selected courses: a list because it doesn't need to be ordered. There would be a data structure for the schedule and that would be an array because it is ordered, and the indexes in the array would fit the class schedule (zero index -> zero period). It would be an optional array for class type course as there is the possibilty that a student does not have classes in certain periods such as zero period. Once they select a course from their selected courses, it will remove it from the list and copy it into the array. If they want to tske a class off the schedule, then they would have to click and drag it back: making the value in the array nil and adding it back into the list.

## QA 
vefifying that it works properly 
user testing plan 

# 4. Print/Email Schedule

## Functionality
After creating a valid schedule, a user can opt to send a PDF version of the finalized schedule to a printer or a designated email address 
## Design

## QA

# 1. Help Ticket Button

## Functionality

## Design

## QA

# 3. Warning upon creation of invalid schedule

## Functionality \ 
When the user is creating their schedule by placing their classes in different class periods into the model 
scheduler, if a class is placed where there is a conflict there will be red text at the top of the screen that
notifies the user that there is a conflict in the schedule, and the user will not be able to place courses in their schedule
until the conflict is resolved.\
 some conflicts include but are not limitted to: \
 invalid privellage period 
 not enough courses/minutes 
 overlapping classes 
 campus conflicts 
 
## Design \
## QA

# 4. Shows classes available once period is highlighted

## Functionality
Once the user has selected their courses from all available courses, on the next section where they have empty slots for the schedule that they need to input their courses to, a user can hover over a slot in the empty slot schedule and the courses availiable in that period will be highlighted. This is availiable to all periods listed in their course selection.
## Design

## QA

# 1. Shows periods available once class is highlighted

## Functionality

## Design

## QA

# 2. Bug Report

## Functionality \
The bug report function: There's a button that users can click on to report a bug. Upon clicking the button, they're brought to a new page. On the page there will be 3 text boxes. In one they'll state how they got to the bug. In another text box they'll explain what the problem that they're experiencing is. In the 3rd text box, they'll leave their email if we may need to contact them for further information or if their bug was handled or not.

## Design \

## QA

# 3. Link to Resources

## Functionality \
Page that includes a list of resources for arena scheduling. This includes (but is not limited to) FAQ, Course descriptions in the Academic Planning Guide, Counslors webpage, Arena Scheduling Help Ticket. This is located in the navigation bar at the vary end and includes a list of resources to all the pages.
	
## Design \

## QA

# 4. Notification for special classes (band, soccer, etc.)
If the user selects a designated 'special' class, an alert is given notifying the user that the class could cause scheduling conflicts. The class would be changed from it's initial color to red, with descriptive text regarding the conflict. 

## Functionality

## Design

## QA

# 1. Information pop up for each class

## Functionality

## Design

## QA

# 2. Filter for Courses

## Functionality \
Users will be able to open a dropdown menu, next to the search bar, in which there will be the following terms: Math, English, Science, Social Studies, Fine arts, Athletics, Electives, AP, Advanced, On-level, Steam, Dual Credit, Filter by difficulty, and filter by periods. 
## Design \

## QA \

# Navbar \

## Functionality \

## Design \ 

## QA \

