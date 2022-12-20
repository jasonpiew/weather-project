# Hi there! Let us try to track a hourly weather from Weathermap API

This project serves me a glimpse of how a data flows, from the api, to storing data, to transform, and to visualize. Well, we all have to start somewhere!

First, you'll need to have some familiarity with Google Cloud Scheduler, Google Cloud Functions, and Google Big Query. Don't worry if you're not an expert – these tools are user-friendly and easy to learn.

### Here are the steps to get started:

1. Sign up for an account with Weathermap API and get an API key to access real-time weather data for various countries.
2. Create a Cloud Function and use Google Cloud Scheduler to schedule it to run on an hourly basis to fetch the weather data from the Weathermap API.
3. Set up a Big Query dataset to store the weather data.
4. Use dbt (data build tool) to transform and clean the data in Big Query. This will create a fact table with relevant weather data (temperature, humidity, etc.) for Southeast countries.
5. Set up a Google Data Studio dashboard to visualize the transformed data.
6. Use dbt Cloud to schedule the transformation of the weather data on an hourly basis to keep your visualizations up to date.

You can look up to the script to look for references, also don't hesitate to contact me, I'd be happy to explain and help, let's get to learn together!!

You got this!
