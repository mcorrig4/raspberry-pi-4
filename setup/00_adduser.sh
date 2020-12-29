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

# Now we need to add user to sudoers file.
# Always use the `visudo` command to edit the file /etc/sudoers because it 
# file validation before saving. To avoid using vim with visudo, run
### EDITOR=nano visudo

# Then edit the file to add the new user to the sudoers file.
### sudo visudo

# Add this like to the end 
### liam ALL=(ALL)

# sudo echo "

# liam ALL=(ALL) NOPASSWD:ALL
# " >> /etc/sudoers

# A better way to do this is to create user specific files inside
# /etc/sudoers.d/ directory
sudo mkdir /etc/sudoers.d/
sudo touch /etc/sudoers.d/liam
# sudo echo "liam ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/liam
sudo echo "liam ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/liam