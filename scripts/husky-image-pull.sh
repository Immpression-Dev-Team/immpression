# This command is already part of the dev-setup.sh file.
# You only need to run this command if you have ran docker system prune -a
# or have deleted the husky image on accident. You will know if the husky
# image is present or not because you will not be able to commit due to an
# error stating docker cannot find the husky docker image. You can manually
# check if the image is on your machine by running docker image ls.
docker pull premsanity/husky-commitlint
