<div align="center" id="top"> 
  <img src="https://raw.githubusercontent.com/docker/compose/main/logo.png" alt="Docker Compose Radiant Electrumx server easy setup" />
  &#xa0;

</div>

<h1 align="center">radiant-testnetserver-easy-setup</h1>

<p align="center">
  <a href="#dart-about">About</a> &#xa0; | &#xa0; 
  <a href="#rocket-technologies">Technologies</a> &#xa0; | &#xa0;
  <a href="#white_check_mark-requirements">Requirements</a> &#xa0; | &#xa0;
  <a href="#checkered_flag-Usage">Usage</a> &#xa0; | &#xa0;
  <a href="#memo-license">License</a> &#xa0; | &#xa0;
  <a href="https://github.com/telostia" target="_blank">Author</a>
  <a href="#memo-license">Donations Welcome</a> &#xa0; | &#xa0;
</p>

<br>

## :dart: About ##

Easy setup and run radiant node and electrumx server with certbot SSL using Docker Compose,Bash Scripts. TESTNET EDITION!!!

## :rocket: Technologies ##

The following tools were used in this project:

- [Radiant-node](https://github.com/RadiantBlockchain-Community/radiant-node)
- [Radiant-Electrumx](https://github.com/RadiantBlockchain-Community/electrumx.git)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/overview/)
- [Bash](https://devhints.io/bash)
- [Python](https://www.python.org/)
- [Git](https://git-scm.com/)
- [Github](https://github.com)

## :white_check_mark: Requirements ##
  docker and docker-compose is required to use this application

### SAMPLE DOCKER|COMPOSE INSTALL GUIDES ###

### To install docker (ubuntu 18.04 example) ###
[docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04)

### To install docker-compose (ubuntu 18.04 example) ###
[docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-18-04)
  OR
### To install docker (ubuntu 20.04 example) ###
[docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

### To install docker-compose (ubuntu 20.04 example) ###
[docker-compose](https://www.digitalocean.com/community/tutorials/how-to-install-docker-compose-on-ubuntu-20-04)
  
  Other requirements include basic knowledge of accessing to Ubuntu linux 18.04 or above and git. You may adapt this application to other linux systems but
  we will not be discussing them here. Windows and Mac Os is also not covered in this guide.

### Open ports using ufw ###
 Open ports 80,443,53002 using ufw
```bash

ufw allow 80/tcp && ufw allow 443/tcp && ufw allow 53002/tcp
```

## :checkered_flag: Usage ##

### Setting up the folders ready ###
 Clone this project
```bash
git clone https://github.com/telostia/radiant-testnet-server-easy-setup
```

 Access the project folder
```bash
cd radiant-testnet-server-easy-setup
```

 Make a copy of .env 
```bash
cp .env.sample .env
```

 fill in your own values in .env file by using nano or any other text editor of your choice.
```bash
nano .env
```

 sample edit:
```bash
rpcuser=bob
rpcpassword=bobrpcpassword
domain=bobdomain.com
email=bobdomain@domain.com
DAEMON_URL=http://bob:bobpassword123z@localhost:17333/
SSL_CERTFILE=/etc/letsencrypt/live/bobdomain.com/fullchain.pem
SSL_KEYFILE=/etc/letsencrypt/live/bobdomain.com/privkey.pem
```
 fill in your own values in.
 to save file in nano, hold control and press x, then let go and press y and press enter


### Obtain a let's encrypto live SSL certificate via certbot ###

(please note that if you have any network servers running like nginx, disable them now for e.g systemctl stop nginx. This script will require port 80 to be available
so if you have failed once, you must delete the .certbot file generated after first use and then run the script again. this is very important. To remove .certbot file type: rm .certbot)

 Run the certbot 1st time and follow instructions on screen. 2nd times onward can be used at least once a day.
 SSL certificates normally expires 3months(90days) so it's good practices to rerun this command once every week or month or if you're proficient in 
 in crontab -e, u can set it to auto run the time frames you want.
```bash
bash run-certbot.sh
```

### Running the radiant node and electrumx server ###
  Once you have obtained an ssl certificate successfully via the above command, you may proceed to edit,build and start the application.

 Make a copy of nginx/conf/app.conf
```bash
cp nginx/conf/app.conf.sample nginx/conf/app.conf
```

```bash
# edit the file in nginx. nginx/conf/app.conf via nano 
# find yourdomainname.com and fill in your domain, the same value you entered earlier in .env file. there should be 5 locations.
```

 start your webserver(nginx), it will auto build and run for you in the background.
```bash
make nbuild
```

 start your radiant node and electrumx server, it will auto build and run for you in the background.
```bash
make build
```

Hopefully everything goes well and now you have yourself your very own electrumx server!!!

if you want to see what's happening behind the scenes when you run the servers, type in ```journalctl -xe```

Your server will now be able to access via photonic wallet, glyph miner or any future supporting apps.
Use the following as sample as the address you need to paste in the apps:
```
https://yourdomain.com:50022/
```
or 
```
wss://yourdomain.com:50022/
```
substitute "yourdomain.com" with your domain name and VOILA!


## :memo: License ##
Use whatever sections of this guide however you wish,however, radiant node and radiant electrumx has their own licenses.

Made with :heart: by <a href="https://github.com/telostia" target="_blank">telostia</a>

## Donations Welcome ##
RXD(radiant): ```1DUtNqt65f3DGGgUfnnsBBJpmnsG5PHsGj```

or if you prefer other currencies :) thank you very much!

BTC(bitcoin): ```bc1q53gfuy3wggzzkxhg5n50szlml0rwz04cvr92jy```

LTC(litecoin): ```ltc1qajzufae2krqp8w802aeser9cfsjw5sus3vy3sz```

If you want to donate in another currency, send me a DM in discord. Cheers :)

&#xa0;

<a href="#top">Back to top</a>