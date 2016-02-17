# myContacts

Allow users to create, update, read and delete a list of contacts 

## Try It (Without node, gulp or bower)
1. Clone or download the project
2. Mount the "build" folder in your localhost
3. Enjoy

## Try It (With node, gulp and bower)
1. Clone or download the project
2. Run `npm install` and `bower install` while in the project root folder
3. Run `gulp dev`
4. Enjoy

## Setup
1. Install [Node.js](http://nodejs.org/)
 - This will also install npm.
1. Run `npm install -g bower gulp yo generator-ng-poly@0.11.5`
 - This enables Bower, Gulp, and Yeoman generators to be used from command line.
1. Run `npm install` to install this project's dependencies
1. Run `bower install` to install client-side dependencies
1. Use [generator-ng-poly](https://github.com/dustinspecker/generator-ng-poly) to create additional components

## Gulp tasks
- Run `gulp build` to compile assets
- Run `gulp dev` to run the build task and setup the development environment
- Run `gulp unitTest` to run unit tests via Karma and to create code coverage reports
- Run `gulp webdriverUpdate` to download Selenium server standalone and Chrome driver for e2e testing
- Run `gulp e2eTest` to run e2e tests via Protractor
 - **A localhost must be running** - `gulp dev`