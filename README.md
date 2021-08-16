# Github Pages Server

This is a basic server that has the ability to sit and watch a repository's branch for updates, serving the content.

## Set up

### Step 1: Clone on target server

    git clone git@github.com:CiscoAandI/github-pages-server.git

### Step 2: Add the SSL Keys and Certificates

After you've configured the ssl keys and certificates, add them into the directory. Name them `nginx.key` and `nginx.crt` respectively.

### Step 3: Build the Container

    docker build . -t github-pages-server:latest

### Step 4: Clone the target repo on the proper branch

Clone the repo who's docs you want to monitor

    git clone -b <branch> <remote_repo>

For example,

    git clone -b gh-pages git@github.com:user/myproject.git

Note: This must be the same branch where the github pages static files are build

Don't forget to change into the directory of your new project!

    cd myproject

### Step 5: Setup Cronjob

    crontab -e

Use the following for the crontab

    * * * * * <git install location> -C <path to target repo> pull origin <branch name>

For example,

    * * * * * /usr/bin/git -C /root/myproject pull origin gh-pages

This will set up a pull once a minute to update the server

### Step 6: Run the nginx container

    docker run -it -d -p 80:80 -p 443:443 -v $(pwd):/usr/share/nginx/html github-pages-server:latest

That's it! You should be able to navigate to the IP in your browser and see your github pages serving!
