# Public Message Board
Public message board using Rest services (Spring boot)
-For easy of use, i also deployed the public message board on https://pmess1.herokuapp.com/

## Requirements and Info
-The complete solution required JAVA 11 to run due to the use of isBlank() string operations.
-The Port for the application is 8085
-No Database is used for the solution, the solution uses static list to maintain the users and static hashmap to maintain the posts fo the message board.
-Just import the project and use goals "mvn clean install" taking care that java 11 is selected, after that just run the application as a spring boot app.
-Docker file is included
-A system.properties file is included for the deployment to heroku for public use.
-The Rest API's produce 200,201,400,401,500 response status codes.

## How to use? Flow?
-When the localhost:8085/ is hit, the index.jsp will load with a simple input field which takes the Name as an identification.
-This identification lasts as long the browser tab is not closed, refreshing the tab will still be considered as the same user.
-The name must be unique per user, which is validated from checks in the code, after the name has been entered the user is now shown the message board.
-The message board has 2 input fields, Topic and message, the user can write the topic and the message and click post to push the message to the board.
-The user is able to delete and edit his own posts, while having the ability to view all the posts, the posts are auto shown via ajax calls.

## Code?
-The code contains MessageRestController to manage all the posts to the message board.
-The code contains UserRestController to manage all the users of the message board.
-The above RestControllers use MessageService and UserService to create,edit,delete,view.
-Post,User and PostResponse and UserResponse Model classes are present, which are sent back to the Ajax requests by the RestControllers via ResponseEntity<?>.
-Each restfull service is hit with ajax calls present in the index.jsp and the view is updated accordingly.

## Tests?
-3 Test cases for the UserService methods are present in UserServiceTest class.
-4 Test cases for the MessageService methods are present in MessageServiceTest class.

## Future Goals?
-I wanted to use Redis to maintain the users and the posts instead of static memory but had less time to do so, will probably do this in the next iteration.
-Was going to use websockets to update the posts without page referesh or ajax calls.
-Add some multi-media, options to send gifs etc.
