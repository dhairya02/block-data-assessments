## Block Renovation - Analyst Case Study

Thanks for your application to Block Renovation! This homework is intended to mimic the type of work you may be expected to complete as a part of the Data & Analytics team. 

There are 2 separate parts to this project. This repo contains a self-contained DB that you can use to answer the prompts below. In order to do so, please ensure that you have installed Docker on your computer. 

Directions on how to do so can be found here: [Get Docker](https://docs.docker.com/get-docker/). You will need Docker running on your computer in order to run this project. 

**General Instructions**
1. Get this project on your computer. We suggest you 
    - Make a directory on your computer
    - Run `git init` in that directory via your terminal
    - Run `git clone git@github.com:block-renovation/block-data-assessments`. This will create a copy of the project on your computer.
2. To run the project:
    - Ensure Docker is running. Follow the directions linked above.
    - From the root of your copy of this repo, run `make docker-up-build`. This will build the Docker image and start the server. It may take a minute or so to startup fully. 
    - This project contains a database (postgres) and a UI to access that database (PGAdmin). You can access the UI by using your web browser to navigate to `localhost:5050`
3. Configure your DB connection 
    - You are more than welcome to access the DB via the CLI using the utilities in the `makefile`. If you are not comfortable doing so, or would rather use a UI, you'll need to configure some details in PGAdmin
    - When you first access the UI, you'll be prompted to input a "master password". We suggest you use `postgres` as the value for simplicity.
    - Click `Add New Server` on the homepage
    - In the modal, name your new connection whatever you want. You can use "block" to keep it simple. 
    - Navigate to the `Connection` tab. The Port, Maintainence database and Username values should be pre-filled. Set the following details:
      - Hostname: `block_db`
      - Password: `postgres`
      - Hit `Save`
4. Run some queries
    - In the top menu, go to `Tools` > `Query Tool`
    - You can expand the left-side Servers menu to see a list of tables and columns
    - Run your queries in the main `Query` UI component
    - PGAdmin has many features. We're only using this for querying data, however you can export CSVs and more. Feel free to use those features if they help your workflow. 
5. Shutting down
    - After you're done with your queries, you will want to shut down the databse
    - Using a terminal/ shell, navigate to the root of the repo
    - Run `make docker-down`
      - This will stop all running Docker containers and purge the related volumes
      - We also recommend you quit (and possibly delete) Docker on your computer. It'll eat up your battery and CPU otherwise. 

## Project Deliverables

If you are unable to complete the assignment in under 2 hours, that is completely OK. Be sure to annotate your work and include a write up in your Google Slides on what remains to be implemented and how you would go about wrapping things up.

We are interested in both your ability to generate analysis and your ability to interpret that analysis.  For your submission, please include all code you write in a public github repo and send the link to your recruiter.

**Requirements:**
- Use SQL for the first 3 questions
- Use CTEs. Do not use nested select statements
- Choose one of the final 2 questions. These can be answers in your scripting language of choice or SQL
- Provide a Google Slides presentation summarizing your findings
- Include your analysis, as well as your commentary 

Block operates in the renovation market, which means that we must maintain a balance between growth and sales, operational efficiency, and project quality. For this assessment, we’ll be focusing on deal value and growth.
 
**Please complete all of the following questions:**
1. Which month has the highest count of valid users created? 
   - A valid user is defined as:
     - Has a Non-Block email address
     - Has User ID 
     - Neither the first name nor last name includes “test” 
2. Which month brought in the highest gross deal value? 
3. What percentage of “closed won” deals does each city account for? 
   - We’ll define a “close won” deal as one that:
     - Has an assigned closed, won date 
     - Has a valid user (use same criteria as question #1)

**Choose 1 of the following:**
1. Assuming a project takes 6 months to complete, and that we recognize the revenue related to a project at 3 points in time 
   - 20% at deal close
   - 40% at the halfway point
   - 40% at completion 
How much revenue are we recognizing per month? For a timeframe, use the earliest project and6 months after the most recently closed project as bookends.


2. How much quarterly business has each Source generated for Block? Which sources are performing above or below their historical monthly benchmarks? 
   - You can define a historical benchmark by whatever method you think fits best - including median, average, or a rolling window of either metric
   - Include a visualization of your comparison in your presentation
   - What trends or insights do you see here? Does anything surprise you?
