# MovieApp

## Overview

MovieApp is an iOS application that displays a list of movies using The Movie Database (TMDb) API. It features a tabbed interface to view now playing, popular, and upcoming movies with paginagion, as well as detailed information for each movie.

<div style="display: flex; justify-content: space-around;">
    <img src="https://github.com/user-attachments/assets/0e49a55e-9798-4cbc-87ed-b69595fbc155" alt="Movies Home" width="300" />
    <img src="https://github.com/user-attachments/assets/c2331740-71ea-4b30-b31d-73b4f4ebe926" alt="Movie Details" width="300" />
</div>

## Architecture

This project follows the **Model-View-ViewModel (MVVM)** design pattern combined with **Domain-Driven Design (DDD)** principles. The architecture is structured into distinct layers, each responsible for a specific aspect of the application.

![Screenshot 2024-09-01 at 5 07 11 AM](https://github.com/user-attachments/assets/0b18828f-bac5-4fd2-8d1f-f0a4a48e6ab3)

### Layers Description

#### Domain Layer
- **Models/**: Contains the core business models of the application. For example, `Movie.swift` represents the movie entity.
- **Repositories/**: Interfaces for data access. `MovieRepository.swift` defines methods for fetching movies.
- **UseCases/**: Contains application-specific business logic. `FetchMoviesUseCase.swift` handles the logic for retrieving movies based on different criteria.

#### Data Layer
- **Models/**: Data transfer objects (DTOs) that map the API responses to the application's data models. For instance, `MovieDTO.swift`.
- **Repositories/**: Concrete implementations of the repository interfaces defined in the Domain layer. `MovieRepositoryImpl.swift` interacts with the `APIClient` to fetch movie data.
- **Networking/**: Handles API requests. `APIClient.swift` is responsible for making network calls to the TMDb API.
- **Caching/**: Implements caching logic, such as `ImageCache.swift` for caching images also we can provide others caching mechanism.

#### Presentation Layer
- **ViewModels/**: Contains view models that manage the data for the views. `MoviesViewModel.swift`,`MoviesCellViewModel.swift` annd `MovieDetailsViewModel.swift` prepares data for displaying in the movie list and detail views.
- **Views/**: Contains the UI components. `MovieListViewController.swift` and `MovieDetailViewController.swift` manage the user interface and user interactions.
- **Resources/**: Contains asset resources like images and colors.

This project Implement error handling mechanisms to gracefully handle network errors, API failures, and unexpected exceptions.

lets exxcute an error to see ,change url constant for upcoming api url then we got error for 404 status code 

 <img src="https://github.com/user-attachments/assets/a8dbe81d-8076-4408-b782-0c14251161ef" alt="Custom Error Example" width="300" />


## Unit Testing

This project includes unit tests to ensure the reliability and correctness of the code. Below is a breakdown of the test files and their purposes:

### Test Files Overview

- **FetchMoviesUseCaseUnitTest.swift**
  - Tests the functionality of the `FetchMoviesUseCase`. It verifies that the use case correctly fetches movies from the repository and handles various scenarios, including success and error cases.

- **FetchMovieDetailsUseCaseUnitTest.swift**
  - Tests the `FetchMovieDetailsUseCase`. This file contains tests to ensure that movie details are fetched correctly and that any errors are handled appropriately.

- **MovieCellViewModelUnitTests.swift**
  - Contains unit tests for the `MoviesCellViewModel`. It checks the data-binding logic and ensures that the view model correctly prepares data for the view.

- **ImageServiceUnitTest.swift**
  - Tests the `ImageCache` service to ensure that image caching behaves as expected. It verifies that images are cached and retrieved correctly.

