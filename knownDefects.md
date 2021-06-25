# Known Defects

## Team A:

### UI
- 1, 2, 3 images at top do not highlight acording to the step that the user is currently working on 

### Reading View
-  using mock data for writing text view
- implement submissionAPI call to get story

### Writing Views 
- user is able to use camera guides and edit scans and populate collectionView, but submit button does not send to backend/AWS 
- login modal view may push() after save is pressed in document scanner
- implement submissionAPI call on submittin pages

### Drawing Views
-  allows user to capture images or load from photoLibrary, but the submit button does not send to backend/AWS 
- implement submissionAPI call to send images

### SubmissionAPI
 - in order to set boolean values in child submission, form data body implementation in  resetSubmissionBoolTo method needs to be implememnted 
 - create observer for child initializer 

## Team B:
### Core Data
- Models are set up to load the correct user profile 
- Networking data needs to be added to allow users to access content and their profile

### Login View Controller and Pin Code View Controller 
- users can securely sign in through Okta Authentication using the Parent profile
- parent profile needs to be refactored to work with profileController
- children can enter their 4 digit pin into the text fields after parent profile securely signs in
- needs to capture an array of pin codes and match it to the child profile
