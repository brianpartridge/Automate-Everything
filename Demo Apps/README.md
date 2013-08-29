# Demo - HelloWorld

## Description

The app built as part of the a Jenkins job.

## Setup

- Install Jenkins.
- Disable unused plugins in Jenkins (Maven, CVS, etc)
- Install required plugins (Xcode, git, TestFlight, etc)

## Demo 1
### Prerequisites
- Install the git and Xcode plugins
- Use xcode-select to select the desired Xcode.app

### Steps

- Show off the local instance of Jenkins:

        http://localhost:8080

- Create a new job named Hello World.
- Specify the git repository path.

        /path/to/Automate-Everything

- Specify the polling frequency.

        # every minute
        * * * * *

- Specify the build settings.
    
        Configuration: 
            Release
        Xcode Project Directory: 
            Demo Apps/HelloWorld
        Build IPA: 
            Checked
            
- Save and a build should automatically start within a minute

## Demo 2
### Prerequisites
- Install the TestFlight plugin
- Under Manage Jenkins, add a token pair for your account and the team you will upload to.

### Steps
- Post build step: Archive the artifacts
    
        Demo Apps/HelloWorld/build/**/*.ipa,Demo Apps/HelloWorld/build/**/*-dSYM.zip
        
- Post build step: Upload to TestFlight:
  - Specify the correct token pair name.

- Post build step: Email Notification
  - Specify the target email address.
  
  

## Demo 3
### Prerequisites
- Fusion is installed with an OSX VM

### Steps
- See ../Demo Scripts/README.md
