"Delete volume if it already exists..."
docker volume rm BackupDemoVolume

"Create volume..."
docker volume create BackupDemoVolume

"Write file to our volume..."
docker run `
  -it `
  -v BackupDemoVolume:/mydata `
  alpine `
  sh -c "echo 'Hello' > /mydata/hello.txt"

"Create backup of volume..."
docker run `
  --rm ` # Auto-delete the container after the command finishes running. No leftover container stays behind.
  -v BackupDemoVolume:/mydata ` # Mounts your Docker volume (BackupDemoVolume) into the container at the folder /mydata.
  -v ${pwd}:/backup ` # Mounts your host’s current folder into the container at /backup.
  alpine `
  sh -c "cd /mydata && tar cvf /backup/backup.tar *"

"Restore backup..."
docker run `
  --rm `
  -v RestoredVolume:/mydata `
  -v ${pwd}:/backup alpine sh `
  -c "cd /mydata && tar xvf /backup/backup.tar"
