###
docker pull javimarlop/ubuntugis-docker
#sshfs xxx@yyy:/local1/majavie/hanksgrass7 /home/webuser/hanksgrass7/
#fusermount -u /home/webuser/hanksgrass7/
docker run --rm -tiv /home/webuser/grassdb:/opt/grassdb javimarlop/ubuntugis-docker
#chmod -R ugo+rwx hanksgrass7/

su user

# python
import os
import sys

GISBASE = os.environ['GISBASE'] = "/usr/lib/grass70"
sys.path.append(os.path.join(os.environ['GISBASE'], "etc", "python"))
import grass.script as grass
import grass.script.setup as gsetup

GRASSDBASE = "/opt/grassdb"
MYLOC = "global_MW"
mapset = 'PERMANENT'
gsetup.init(GISBASE, GRASSDBASE, MYLOC, mapset)

print grass.gisenv()
grass.run_command('g.region',flags='p')
grass.run_command('g.list',typ='vect')


