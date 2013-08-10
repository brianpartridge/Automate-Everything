# Demo - HelloWorld

## Description

The app build as part of the a Jenkins job.

## Setup

- Install Jenkins.
- Disable unused plugins in Jenkins (Maven, CVS, etc)
- Install required plugins (Xcode, git, TestFlight, etc)

## Demo Steps

- Show off the local instance of Jenkins:

        http://localhost:8080

- Create a new job named Hello World.
- Specify the git repository path.

        /path/to/Automate-Everything-Continuous-Integration-for-iOS-and-Mac

- Specify the polling frequency.

        # every minute
        * * * * *

- Specify the build settings.
    
        Configuration: 
            Debug
        Xcode Project Directory: 
            Demo/HelloWorld
        Build IPA: 
            Checked

- Post build step: Archive the artifacts
    
        Demo/HelloWorld/build/**/*.ipa,Demo/HelloWorld/build/**/*-dSYM.zip
    
- Save and a build should automatically start within a minute