# Flower Classification Application

This repository contains the source code for the Flower Classification Application. The app is built using Swift and incorporates machine learning models to classify different types of flowers.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Usage](#usage)
5. [Dependencies](#dependencies)
6. [Contributing](#contributing)

## Introduction

The Flower Classification Application is designed to help users identify various types of flowers using machine learning models. The app captures an image of a flower and predicts its category. This can be useful for educational purposes, gardening, or just for fun.

## Features

- Real-time Flower Classification: Capture images using the camera and classify flowers in real-time.
- Machine Learning Integration: Utilizes advanced machine learning models for accurate predictions.
- Wikipedia api integration to get flower details. 
- User-friendly Interface: Easy-to-use interface designed for a seamless user experience.

## Installation

To set up the project on your local machine, follow these steps:

1. Clone the repository:

```sh
git clone https://github.com/adnanAlKharfan/Flower-Classification-Application.git
```

2. Navigate to the project directory:

```sh
cd Flower-Classification-Application
```

3. Open the project in Xcode:

```sh
open tweenty\ course\ app.xcworkspace
```

4. Install dependencies using CocoaPods:

```sh
pod install
```

5. Download the machine learning model:

    - Visit the following link to download the machine learning model: [Download Model](https://drive.google.com/file/d/1YAC-5FBdTb4ANQwOWBEGIScUkHWld9Em/view?usp=share_link)

    - Copy the downloaded model into the project.


## Usage

1. Launch the app in Xcode:

    - Select the target device (e.g., iPhone simulator or connected device).
    - Click on the run button or press Cmd + R to build and run the app.

2. Capture or upload a flower image:

    - Use the camera functionality to capture an image or upload an image from the gallery.

3. View the classification result:

    - The app will display the predicted flower type along with additional information from wikipedia.

## Dependencies

The project relies on the following dependencies:

- Alamofire: A Swift-based HTTP networking library.
- SwiftyJSON: A library to handle JSON data in Swift.
  
These dependencies are managed using CocoaPods.

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request.

