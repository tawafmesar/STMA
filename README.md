

![STMA](https://github.com/tawafmesar/STMA/blob/main/STMA.png?raw=true)

# STMA (Saudi Tourism Mobile Application) 

STMA is a comprehensive mobile application designed to provide information and services related to tourism in the Kingdom of Saudi Arabia. Developed using Flutter, PHP, and MySQL, STMA aims to enhance the travel experience by offering detailed insights, guides, and tools for tourists exploring Saudi Arabia.

## Features 🌟

- *Tourist Information:* Access detailed information about tourist attractions, historical sites, and cultural landmarks across Saudi Arabia.
- *Service Listings:* Find and book services such as hotels, restaurants, and tours.
- *Interactive Maps:* Navigate through Saudi Arabia with interactive maps highlighting key tourist spots.
- *User Reviews and Ratings:* Read reviews and ratings from other travelers to make informed decisions.
- *Personalized Itineraries:* Create and manage personalized travel itineraries.
- *Multilingual Support:* Available in multiple languages to cater to a diverse range of tourists.

## Technologies Used 🛠️

- *Flutter:* Front-end framework for building native mobile applications.
- *PHP:* Backend scripting language for server-side logic.
- *MySQL:* Database management system for storing app data.

## Getting Started 🚀

To get a local copy of this project up and running, follow these steps:

1. *Clone the repository:*

   bash
   git clone https://github.com/tawafmesar/STMA.git
   

2. *Set up the backend:*
   - Clone the backend repository:

     bash
     git clone https://github.com/tawafmesar/STMABackend.git
     

   - Configure your PHP environment to host the backend scripts.
   - Import the MySQL database schema provided in the [database/stmstm6_stmstm6.sql](https://github.com/tawafmesar/STMABackend/blob/main/database/stmstm6_stmstm6.sql).

3. *Edit the server URL:*
   - Open the lib/linkapi.dart file in the Flutter project.
   - Set the server variable to your backend server URL:

     dart
     static const String server = "http://your-backend-server-url";
     

4. *Run the Flutter application:*
   - Open the project in your preferred Flutter IDE.
   - Configure the Flutter app to connect to your backend endpoints.

## Contributing 🤝

Contributions are welcome! If you'd like to contribute to STMA, please fork the repository and create a pull request with your changes. For major changes, please open an issue to discuss what you would like to change.



