# sdet-tokopedia
I'm using Ruby Capybara for the automation

There are 1 main folder 5 subfolder for the automation

The feature folder consist of config, lib, pages, step_definitions & support
The configs are to store the the credential or required user data for the script
The lib is to connect between yml file and the steps file

The support folder consist of env and pages
Its mostly consist of supporting software that are required for the script to run

The data folder consist yml file
The yml file is for the required user data

The feature folder consist feature file
Feature file is for the test cases and written in gherkin

The pages folder will consist the list of element used in the script

The step_definitions folder consist of steps file
Steps file are the the automation script, its writtern ruby progamming using selenium capybara framework

As for the script the approach will go like this :
    1. Start by loggin in
    2. Verify if the user successfully logged in
    3. Sort and add the highest price item to cart
    4. Insert the requested data and checkout the chosen item

To run you can use the following command 'cucumber feature/tokped.feature', but make sure that you are already in the web_test folder
