# iOS Code Test

iOS Code test written in Swift using 
MVVM with RxSwift

## Installation

Clone the project using

```bash
git clone <:url>
```

Install the needed dependencies to run 
the app (PLS you need to have install 
CocaPods on your local machine - you can 
use `brew`)

```bash
pod install
```

## Usage

Select the simulator where you want to 
see the app and start running the 
application.

## Structure

We have the app base on different MVVM 
Modules, each module has his own 
`router-wireframe` to handle his own 
navigation. 

Each time the app needs to perform an 
API Request talks with 
`ManagerConnection` which handle all API 
Request and together with some `Codable` 
stuff we get the final response parsed 
from there. 

Also there is a `Constants` file which 
has all the needed static properties 
used around the entire app.

The structure of the app has been 
decided by the recruiter.

## Contributing
Pull Request are not allow. This code 
has been made only with a technical test 
purpose. If you have any question 
regarding the policies and laws 
including here do not hesitate in 
contact me.

## License
[MIT](https://choosealicense.com/licenses/mit/)
