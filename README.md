Summary:
Opens up single instance of MS Edge with 5 tabs to the popmart URL.  
- Command allows input of any set Number, any product ID, and allows the increment number to be auto incremented within the 5 tabs. Tabs are not opened at the same time (there is a random delay built in).

How to use:
1. Download the labuAuto.ps1 script to your download folder.
2. Open PowerShell and navigate to your download folder.
3. Type command below (Temporarily allow you to run script):
   Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
4. Start using the script using example command below:
   labuAuto.ps1 -setNumber 40 -productId 10006057800280 -incrementNumber 6000

Note: 
- The setNumber is the set that you're looking to access.  
- The productId is the full 14 number Id.  
- The incrementNumber is the starting number you would like for the browser to start opening at (5 tabs will open and auto increment this number by 1).
- You can continue to do run the above command to open up more tabs.
