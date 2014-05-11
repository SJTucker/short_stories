#User Stories

##Viewing the Menu

As someone who is unfamiliar with the application
I want to see a list of options
So that I can use the program

Acceptance Criteria:
  * If the user selects 1, they see "A list of all stories"
  * If the user selects 2, they see "What genre would you like to select?"
  * If the user selects 3, they see "What is the name of the story you would like to search for?"
  * If the user selects 4, they see "What is the name of the author you would like to search for?"
  * If the user selects 5, they see "What decade (i.e. 1960s) would you like to read from?"

Usage:

  > ./short_stories
  How would you like to search for short stories?
  1. See a list of all stories
  2. Search by Genre
  3. Search by Title
  4. Search by Author
  5. Search by Decade


## Searching by Genre

As someone who is wanting to search by Genre
I want to see a list of genres
So that I can select one

Acceptance Criteria:
  * The genre selected will show a list of the stories in that genre

Usage:

  >./short_stories
  How would you like to search for short stories?
  1. See a list of all stories
  2. Search by Genre
  3. Search by Title
  4. Search by Author
  5. Search by Decade
  - 2
  What is the genre you would like to search?
  1. Fantasy
  2. Mystery
  3. Non-Fiction
  .....
  - 1
  1. Lord of the Rings
  .......

##Seeing all stories

As someone who is wanting to look at every story in the database
I want to see a list of all stories
So that I can select one

Acceptance Criteria
  * A list of all stories is presented

Usage:
  
  >./short_stories
  How would you like to search for short stories?
  1. See a list of all stories
  2. Search by Genre
  3. Search by Title
  4. Search by Author
  5. Search by Decade
  - 1
  Here is a list of all stories in the database:
  1. Lord of the Rings
  2. As I Lay Dying
  .....
  - 1
  Text for the story
