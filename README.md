KobeMovieApp - the number one choice for upcoming movies.

Find a list of movies soon to be in theaters. Search by name or scroll the whole list.

1 - In order to run the app
Carthage is necessary to install dependencies.

Via terminal, acess the project folder

type carthage update --platform ios

After download and build is done, project is ready to run, make sure to setup profiles to run in a real device.

2 - Dependencies
Alamofire - makes API service access much easier, abstracting the details of NSURLSession to speed up client development. Kind of overkill to this app but I'm used to it and I'd rather not copy from TMDB code generation.

Kingfisher - image download, async downloading and caching in a few line of code.

*Carthage - straightforward dependency manager
