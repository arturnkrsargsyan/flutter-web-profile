# LoanXtimate


## Features

- **Web-First Design**: Optimized for web, app delivers a smooth and efficient experience across various screen sizes and devices.
- **Intuitive Navigation**: Utilizing GoRouter, LoanXtimate offers a straightforward and intuitive navigation experience, allowing users to move through different sections of the app seamlessly.
- **State Management**: Powered by Provider, Riverpod, and Hooks, the app ensures a robust and easily manageable state throughout the application, enhancing performance and user experience.
- **Asset Management**: With FlutterGen,we employ a type-safe way of accessing assets. Say goodbye to the hassle of string paths ;)

## Getting Started

To get started with LoanXtimate, follow these simple steps:

1. **Clone the Repository**: Begin by cloning the repository to your local machine.

    ```
    git clone https://Tigran_Elyazyan@bitbucket.org/quantumsoftwaredesignllc/loanxtimate_tigran.git
    ```

2. **Install Dependencies**: Navigate to the project directory and install the necessary dependencies.

    ```
    cd loanxtimate
    flutter pub get
    ```

3. **Run Build Runner**: Execute the build_runner command to generate necessary files, especially for those features that require code generation.

    ```
    flutter packages pub run build_runner build --delete-conflicting-outputs
    ```

   This command is particularly useful for generating code for your models, serializers, and other tasks that are managed by build_runner.

4. **Run the App**: Start the app by running the following command. Ensure you're targeting the web since LoanXtimate is a web-exclusive app.

    ```
    flutter run -d chrome
    ```

## Building and Deploying

To build and deploy LoanXtimate to Firebase Hosting, follow these steps:


1. **Install Firebase CLI**:

    ```
    npm install -g firebase-tools
    ```

       
2. **Build your Flutter Web App**:

    ```
    flutter build web
    ```

3. **Deploy to Firebase Hosting**:

    - Login to Firebase:

        ```
        firebase login
        ```

    - Deploy your app:

        ```
        firebase deploy --only hosting
        ```

   The app will be available at `https://loanxtimate.web.app`.

## Project Structure

- `lib/`: Contains the Dart files for the project.
- `assets/`: Holds all the asset files like images and icons.
- `pubspec.yaml`: The Flutter project metadata and dependency file.


