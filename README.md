MIST-353 Assignment 3: Prototype Development and Research for Web Application
 =============================================================================
 
 
### This repository contains all of the SQL files needed in order to create GeoSnowDatabase

**Compiling of Ideas**

  a. We decided since all of our ideas and preliminary research coinsided with each other that it would be the best idea to run with the best front end that we came up with and build existing ideas into that.

  b. Our combined idea will be a snow-resort booking site that will allow users to see the weather for the dates they select while also being able to see a real time forum about the selected or searched resort. Our users will also be able to signup for our newsletter which will keep them updated on various details pertaining to upcoming deals and ect.

**Six Store Procedures**

1. ***AddForumPost***

   a. This store procedure simply adds a post in the ForumPost table

   source: [ChatGPT](openai.com) Prompt: "create a store procedure that adds the instance of a post to my ForumPost table"
2. ***DeleteForumPost***
   
    a. This store procedure simply deletes a post in the ForumPost table

    source: [ChatGPT](openai.com) Prompt: "create a store procedure that deletes the instance of a post to my ForumPost table"

3. ***GetPostByResort***

   a. This store procedure simply fetches posts in the ForumPost table that contain the specfified ResortID

   source: [ChatGPT](openai.com) Prompt: "create a store procedure that fetched the instance of a post from my ForumPost table according to ResortID"

4. ***AddSubscriber***

   a. This store procedure simply adds an instance of a subscriber into the NewsletterSubscribers table

   source: [ChatGPT](openai.com) Prompt: "create a store procedure that adds the instance of a subscriber in the NewsletterSubscribers table"

5. ***RemoveSubscriber***

   a. This store procedure simply deletes an instance of a subscriber into the NewsletterSubscribers table

   source: [ChatGPT](openai.com) Prompt: "create a store procedure that removes the instance of a    subscriber in the NewsletterSubscribers table"

6.  ***CheckEmailSubscription***

     a. This store procedure that checks for an instance of a subscriber in the NewsletterSubscribers table

    source: [ChatGPT](openai.com) Prompt: "create a store procedure that checks for the instance of a    subscriber in the NewsletterSubscribers table"


**DatabaseCreation**
1. ***DatabaseCreation.sql***

   a. Our database is well representative of Mr. Meadows TravelSiteDB, this is because we have very similar ideas. The difference is we will have a blog forum as well as a newsletter function that his does not contain.

   source: [ChatGPT](openai.com), [TravelSiteDB](https://github.com/joshuatmeadows/MIST353-TravelSite/blob/dev/SQL/TravelSiteDBCreationClean.sql)

   Prompt: "give a list of attributes that would take care of handling a blog", "give me a list of the attributes that would take care of having a NewsletterSubscription table "


**DatabaseData**

1. ***DatabaseData.sql***

   a. Our database is seeded with mock data provided by ChatGPT

   source: [ChatGPT](openai.com)

   Prompt: "create 5 values of data for each table in my database according to my DatabaseCreation.sql file "
