#Development Setup#

###Web Environment###

* Asana - Task Organization
* HipChat Account - Communication
* GitHub Account - Code Management and Storage
* Twitter - Account
* Twitter Developers Application - Application

####Instructions####

1\. <a href="https://twitter.com/signup" target="_blank">Create a Twitter Account</a>

2\. <a href="https://dev.twitter.com/apps" target="_blank">Sign into Twitter Developers with your Twitter Account</a>

3\. Create a Twitter Application

4\. Set the Access Level to "Read and write"

5\. Create an Access Token

6\. <a href="https://asana.com/?utm_source=app.asana.com&utm_campaign=app.asana.com" target="_blank">Create an Asana Account</a>

7\. Ask Paul for a HipChat Account

8\. Create a HipChat Account

9\. <a href="https://github.com/join" target="_blank">Create a GitHub Account</a>

##Mac Instructions##

###Development Environment###

* Ruby - Programming Language
* RubyGems - the Ruby community's gem hosting service and sophisticated package manager.
* RVM (Ruby Version Manager) - RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems
* Homebrew - Package Manager
* Xcode - Mac Developer Tools
* Xcode Command Line Tools - Command Line Tools
* Git - Version Control System
* GitHub Application - Code Management
* HipChat Application - Communication

###Setup the Development Environment###

1\. Update RubyGems or <a href="http://rubygems.org/pages/download" target="_blank">Download and Install RubyGems</a>

```bash
gem update --system
```

2\. Install Homebrew

```bash
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

3\. Install RVM (Ruby Version Manager)

```bash
\curl -L https://get.rvm.io | bash -s stable
```

4\. Install Ruby

```bash
rvm install 2.1.0
```

5\. Install Rails

```bash
gem install rails
```

6\. Download Xcode

7\. Install Xcode Command Line Tools

8\. Install oauth

```bash
sudo gem i oauth
```

9\. Install twurl

```bash
sudo gem i twurl
```

10\. Begin the authorization of your Twitter account to make API requests

```bash
twurl authorize --consumer-key key --consumer-secret secret
```

* `key` is your application's consumer-key

* `secret` is your application's consumer-secret

11\. Enter the returned URL into your browser

12\. Click "Authorize app"

13\. Enter the returned PIN back into the terminal

14\. <a href="http://mac.github.com/" target="_blank">Download the GitHub Application</a>

15\. <a href="https://www.hipchat.com/downloads#mac" target="_blank">Download the HipChat Application</a>

###Commands###

####Homebrew Commands####

######Check that Homebrew Functions Properly######

```bash
brew doctor
```

######Check Homebrew Version######

```bash
brew --version
```

######List all installed formulae######

```bash
brew list
```

######Update Homebrew######

```bash
brew update
```

####RVM Commands####

######Check RVM Version######

```bash
rvm -v
```

######See all versions of Ruby installed on your computer######

```bash
rvm list
```

######Use a specific version of ruby######

```bash
rvm use version_number
```

`version_number` is the version of ruby you would like to use

####RubyGems Commands####

######Check RubyGems Version######

```bash
gem -v
```

######See all versions of Rails installed on your computer######

```bash
gem list rails
```

######See all gems installed on your computer######

```bash
gem list --local
```

####Ruby Commands####

######See where ruby is installed on your computer######

```bash
which ruby
```

####Git Commands####

######Show the working tree status######

```bash
git status
```

######Check git Version######

```bash
git --version
```

######Update your repository######

```bash
git pull
```

####GitHub Commands####

######Open GitHub Application while in a Repository######

```bash
github
```

##Windows Instructions##

###Development Environment###

* Ruby - Programming Language
* RubyGems - the Ruby community's gem hosting service
* RVM (Ruby Version Manager) - RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems
* Git - Version Control System
* HipChat Application - Communication

1\. <a href="http://railsinstaller.org/en" target="_blank">Download RailsInstaller</a>

2\. <a href="http://windows.github.com/" target="_blank">Download the GitHub Application</a>

3\. <a href="https://www.hipchat.com/downloads#windows" target="_blank">Download the HipChat Application</a>

##Ubuntu Instructions##

###Development Environment###

* Ruby - Programming Language
* RubyGems - the Ruby community's gem hosting service
* RVM (Ruby Version Manager) - RVM is a command-line tool which allows you to easily install, manage, and work with multiple ruby environments from interpreters to sets of gems
* Git - Version Control System
* HipChat Application - Communication

1\. Update Ubuntu

Run the following in the terminal, and enter the password.

```bash
sudo apt-get update
```

2\. Install Git Dependencies

```bash
sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev build-essential
```

3\. Install Git

```bash
sudo apt-get install git
```

4\. Install curl

```bash
sudo apt-get install curl
```

5\. Install RVM

```bash
\curl -L https://get.rvm.io | bash -s stable --ruby
```

6\. Verify that ruby is Installed

```bash
ruby -v\
```

7\. Install the HipChat Application for Linux

```bash
sudo su
echo "deb http://downloads.hipchat.com/linux/apt stable main" > \
  /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
apt-get update
apt-get install hipchat
```
