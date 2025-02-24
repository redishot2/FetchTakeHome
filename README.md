### Build tools & versions used
Created using Xcode 15.4. Minimum supported OS is iOS 17. 

### Summary: Include screen shots or a video of your app highlighting its features
Content State | Error State
--- | --- 
![Simulator Screenshot - iPhone 15 Pro - 2025-02-24 at 18 17 44](https://github.com/user-attachments/assets/9ae2d385-ae95-4d71-b89d-d19167d6ac0f) | ![Simulator Screenshot - iPhone 15 Pro - 2025-02-24 at 18 17 50](https://github.com/user-attachments/assets/fd98d443-d238-4220-ae3b-44ed36af4072)

### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas?
UI makes the biggest impact when you're using an app, so UI is where I spent the most time. I enjoyed designing a layout that can display the neccessary content to the user while also feeling obvious and intuitive to use. 

### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time?
About 9 hours. I started with the networking and codable classes so I could have some data to work with. I built them using test first design so the majority of the tests were complete before I began on UI. I probably spent the most amount of time on the UI perfecting the look and experimenting with features. Then I spent a good deal of time perfecting and double checking for any missed requirements.

### Trade-offs and Decisions: Did you make any significant trade-offs in your approach?
UI is my favorite so I could have kept going on a lot of it. Specifically I would have loved to add ScrollView paging with actor animations. I had to limit myself to just doing what the project asked for so it wouldn't get too large. As it is, there are already a fair number of classes to review. 

### Weakest Part of the Project: What do you think is the weakest part of your project?
The networking feature. While it functions fine, I'm not happy with the convoluted NetworkingErrors section. It makes sense to me, but I fear a new developer would need a minute to understand it. I strive to create easy to understand code, and that particular section is the ugliest in the app. 

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.
I added some filler UI to beef up the flavor text on the cards. Cook time, star rating, and servings are hard-coded. 
I originally wanted to support 16.0+ as is the current standard at Fetch, but I wanted to use some of the new ScrollView features only available in iOS 17.0+. 
