### Ubuntu 18.04 LTS Install

On a clean ubuntu install:

First create a non-root user and log in as this user:

```
adduser financier
# follow the prompts

# This gives financier user sudo access
sudo usermod -aG sudo financier

# Log in as this user
su financier
cd ~/
```

Now once you're logged in as a non-root user, run:
```
# install curl  
sudo apt install curl

bash <(curl -s https://raw.githubusercontent.com/FarhanOmar/financier/master/install_ubuntu_install.sh)

# enter any prompts when needed
```
Notes:
* When the CouchDB installation prompts you for input, use the defaults (and be sure to enter an admin password)
