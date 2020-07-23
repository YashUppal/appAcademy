# Decomposition into Objects

## Object Oriented Design

* A problem can be broken down into smaller classes. Each class with do one thing by virtue of the **Single Responsibility Principle**. The level of granularity will be decided by the fact that at what level changes are being made. If we were to run an aquarium simulation, making classes for different types of fishes is a good idea, instead of making a single aquarium class. Similarly, it will be overkill to define a ```FishEye``` and ```FishTail``` class for each fish.