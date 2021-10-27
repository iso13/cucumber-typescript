## LimelightHealth e2e Automation

## Features

- All scripts written in with Typescript and Cucumber
- Generated HTML reports and screenshots on failure
- Page Object design pattern
- Placeholder Text element selection and blue harvest methods
- World class implementation

## Dependencies Install (Mac)

1.Homebrew - Package manager for installing apps on your Mac.
https://docs.brew.sh/Installation

2.Java 1.8 - You will also need to add the following code to `~/.bash_profile`

```
export JAVA_HOME=$(/usr/libexec/java_home)
```

3.TypeScript

```
brew install typescript
```

4.NodeJS version 8
4.1.The latest (4/30/2019) availabe minor version is 8.16.0

```
brew install node@8
```

4.2.Follow the instructions of Node and add system variables (if they were not added automatically):

```
echo 'export PATH="/usr/local/opt/node@8/bin:$PATH"' >> ~/.bash_profile
export LDFLAGS="-L/usr/local/opt/node@8/lib"
export CPPFLAGS="-I/usr/local/opt/node@8/include"
```

4.3.Re-open the terminal and check if you have Node successfully installed:

```
node --version
npm --version
```

5.Webdriver Manager - Used to manage your selenium server and chrome driver

5.1. Install webdriver-manager globally

```
npm install -g webdriver-manager
```

5.2. Pull the latest versions of selenium server and chromedriver

```
webdriver-manager update
```

5.3. (optional) Check if selenium server and chromedriver are installed successfully

```
webdriver-manager status
```

6.Maven - We will be using maven to manage some reporting

```
brew install maven
```

7.Gulp - Leveraging to watch for updates in reports and generate

```
npm install -g gulp-cli
```

## Dependencies Install (Windows)

1.Choclatey - Package manager for installing apps on your Windows machine.
https://chocolatey.org/install

2.Java 1.8 - You will also need to add the following code to `~/.bash_profile`

```
export JAVA_HOME=$(/usr/libexec/java_home)
```

3.NodeJS version 8.8.1

```
choco install nodejs
```

4.npm - Used to manage modules and dependencies for the project

```
choco install npm
```

5.Webdriver Manager - Used to manage your selenium server and chrome driver

5.1. Install webdriver-manager globally

```
npm install -g webdriver-manager
```

5.2. Pull the latest versions of selenium server and chromedriver

```
webdriver-manager update
```

5.3. (optional) Check if selenium server and chromedriver have been installed successfully

```
webdriver-manager status
```

6.Maven - We will be using maven to manage some reporting

```
choco install maven.
```

7.Gulp - Leveraging to watch for updates in reports and generate

```
npm install -g gulp-cli
```

## Dependencies Install (Linux - Debian based)

1.  Install nvm (check https://github.com/nvm-sh/nvm for latest version)

        $ curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

    Verify the installation

        $ nvm -v

2.  NodeJS version 8

        $ nvm install v8.16.1
        $ nvm use v8.16.1
        $ nvm alias default 8

3.  Verify Node installation

        $ node -v
        $ npm -v

4.  Java 8

        $ sudo apt-get install openjdk-8-jre

    And verify installation

        $ java -version

5.  Webdriver Manager - Used to manage your selenium server and chrome driver

    5.1. Install webdriver-manager globally

        npm install -g webdriver-manager

    5.2. Pull the latest versions of selenium server and chromedriver

        webdriver-manager update

    5.3. (optional) Check if selenium server and chromedriver have been installed successfully

        webdriver-manager status

6.  Maven - We will be using maven to manage some reporting

        sudo apt install maven

7.  Gulp - Leveraging to watch for updates in reports and generate

        npm install -g gulp-cli

## Automation Setup

- Clone the repository:

```
git clone git@bitbucket.org:limelighthealth/limelighte2e.git
```

- Download and save the flat login configuration file [here](https://limelight.atlassian.net/wiki/spaces/LH/pages/518488204/App+Login+Configuration) and save it as `/config/users.json`

- Inside your project run the following to pull in all your dependencies:

```
npm install
```

- _Windows Only:_ If npm install fails due an error on node-canvas dependency, please follow "Install Manually" instructions from [here](https://github.com/Automattic/node-canvas/wiki/Installation:-Windows)

- Generate a reports directory which will actively monitor for changes after each run to generate an html report. You need to run `gulp` before the first build of the project

```
gulp
```

- Compile and build the typeScript

```
npm run clean-build
```

## Automation Execution

- First lets make sure you have the latest drivers. Open a terminal in your project and run:

```
webdriver-manager update
```

- Let's start up a local selenium server

```
webdriver-manager start
```

- Open a new terminal and run the following to execute all the Scenarios

```
npm run protractor
```

#### Keep your Chrome browser and chromedriver versions in sync

It's _your responsibility_ to keep your Chrome browser and chromedriver versions in sync.
If you start your test run and get the error message similar to:

> E/runner - Unable to start a WebDriver session.
> SessionNotCreatedError: session not created: Chrome version must be between 71 and 75

that means you have to update your chromedriver or standalone server or both:

- clear out the server and driver files to ensure there are no outdated instances

```
webdriver-manager clean
```

- perform steps 5.2 - 5.3 above for your platform

## Execution by Environment

- Cucumber execution by specifying the base environment (i.e. dev, uat, test, prod)
- Current environment URLs can be found here: https://limelight.atlassian.net/wiki/spaces/LH/pages/646676688/Project+Environments

```
npm run protractor -- --params.env='localhost'
```

## Execution by Cucumber Tags

- Cucumber execution by tags allows you to pick and choose what Scenarios to run.

Run only `@example` Scenarios

Mac:

```
npm run protractor -- --capabilities.chrome.platform='MAC' --browsers='chrome' --cucumberOpts.tags='@example'
```

Windows:

```
npm run protractor -- --capabilities.chrome.platform="Windows 10" --browsers="chrome" --cucumberOpts.tags="@example"
```

Run `@login` and `@logout` Scenarios

Mac:

```
npm run protractor -- --capabilities.chrome.platform="ANY" --browsers="chrome" --cucumberOpts.tags='@login and @logout'
```

Windows:

```
npm run protractor -- --capabilities.chrome.platform="ANY" --browsers="chrome" --cucumberOpts.tags="@login and @logout"
```

Run `@login` and not `@logout`

Mac:

```
npm run protractor -- --capabilities.chrome.platform="ANY" --browsers="firefox" --cucumberOpts.tags='@login and ~@logout'
```

Windows:

```
npm run protractor -- --capabilities.chrome.platform="ANY" --browsers="firefox" --cucumberOpts.tags="@login and ~@logout"
```

## Logging

Leveraging Log4js we can inject logs within functions and step definitions.

```
this.logger.info('Some Message');
this.logger.debug('Some Debug Message');
this.logger.error('Some Error');
```

## Reporting

If you want to have reports generated on the fly. The gulp tasks will automatically monitoring changes in the cucumber.json and update the reports on the fly. You will need to run `gulp` in a terminal or command window. Reports are generated under /reports/cucumber-html-reports/overview-features.html

## Browsers

Tests can be run with one or many browsers. To run multiple browsers use the following parameters when running protract from the command line

```
--browsers="firefox,chrome,ie,firefoxHeadless,chromeHeadless,edge"
```

If no browser is specified then chrome will run on it's own as default

If you want to change the default browser config you can do so via command line when running protractor such as

```
--capabilities.chrome.platform="ANY"
```

The only constraint right now is that to run edge you must manually download the edge driver and run the webdriver manually first

```
webdriver-manager start --edge "C:\path_to_the_driver\MicrosoftWebDriver.exe"
```

If not specified, by default will be set to --browsers='chrome'

## Running tests in parallel

1.  `maxSessions`

    If you have more than one browser node (e.g. [docker-compose.yaml](docker/compose/docker-compose.yaml)), you may want to run your tests in parallel using `maxSessions` parameter:

        npm  run protractor -- --cucumberOpts.tags='@trinet and @blocker and not @wip' --browsers='chrome' --maxSessions=4

2.  Multiple browsers

        npm run protractor -- --cucumberOpts.tags='@trinet and @blocker and not @wip' --browsers='chrome,chromeHeadless' --maxSessions=4

3.  `isParallelByScenario`

    By default it will run features in parallel, but it can be set to run scenarios in parallel by setting the `isParallelByScenario` parameter to `true`:

        npm run protractor -- --cucumberOpts.tags='@trinet and @blocker and not @wip' --browsers='chromeHeadless' --maxSessions=4 --isParallelByScenario=true

4.  Turning off video recording

    By default, it captures video of test run execution. You can find them in `./docker/zalenium/videos` project folder.
    The downside of that is that in some cases it significanntly slows down scenario execution.
    Capturing feature can be turned off with browser capability `recordVideo` setting:

        npm run protractor -- --cucumberOpts.tags='<your tags>' --browsers='chrome' --maxSessions=1 --capabilities.chrome.recordVideo=false
