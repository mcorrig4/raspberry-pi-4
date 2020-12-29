# The default username and password are
# username: pi
# password: raspberry

# Since this is a basic testing device, I'm going to leave the default sudo 
# user for easy access and troubleshooting. In a production environment 
# this user needs to have the password changed.

# Making a new user for myself, liam
sudo adduser liam
# add liam to sudo group
sudo usermod -aG sudo liam
# verify the id
id liam