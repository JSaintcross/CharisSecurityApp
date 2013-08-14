#!/bin/bash

echo "MySQL username?"
read username

echo "MySQL password?"
read pw

echo "Database Name?"
read db

#clear baselines table; reset autoincrement; add LOW, MOD, HIGH

mysql -u$username -p$pw $db -e \ "DELETE FROM baselines; ALTER TABLE baselines AUTO_INCREMENT=1; INSERT INTO baselines (title,description) values ('LOW','low baseline'),('MOD','mod baseline'),('HIGH','high baseline'), ('MODONLY','for controls only in mod, do not display!');"


#add oldid column to sources; load sources.csv

mysql -u$username -p$pw $db -e \ "ALTER TABLE sources ADD COLUMN oldid integer; LOAD DATA INFILE '/tmp/sources.csv' INTO TABLE sources FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (title, description, versiondate, versionnum, oldid);"

#load families.csv

mysql -u$username -p$pw $db -e \ "LOAD DATA INFILE '/tmp/families.csv' INTO TABLE families FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (title, acronym, description);"

#add oldid, oldsourceid column to controls; load controls.csv

mysql -u$username -p$pw $db -e \ "ALTER TABLE controls ADD COLUMN oldid integer, ADD COLUMN oldsourceid integer; LOAD DATA INFILE '/tmp/controls.csv' INTO TABLE controls FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (ctrlnumber, baseline_id, withdrawn, title, description, supplemental_guidance, priority, oldid, oldsourceid);"

#add oldparentid to subcontrols; 

mysql -u$username -p$pw $db -e \ "ALTER TABLE subcontrols ADD COLUMN oldparentid integer; LOAD DATA INFILE '/tmp/subcontrols.csv' INTO TABLE subcontrols FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n' (subctrlnumber, baseline_id, withdrawn, title, description,supplemental_guidance, oldparentid);"

#re-establish relationships using old ids

#add source_id to controls
mysql -u$username -p$pw $db -e \ "UPDATE controls INNER JOIN sources ON controls.oldsourceid = sources.oldid SET controls.source_id = sources.id;"

#add family_id to controls
mysql -u$username -p$pw $db -e \ "UPDATE controls INNER JOIN families ON LEFT(controls.ctrlnumber, 2) = families.acronym SET controls.family_id = families.id;"

#add control_id to subcontrols
mysql -u$username -p$pw $db -e \ "UPDATE subcontrols INNER JOIN controls ON subcontrols.oldparentid = controls.oldid SET subcontrols.control_id = controls.id;"


#cleanup, drop unused columns

mysql -u$username -p$pw $db -e \ "ALTER TABLE controls DROP COLUMN oldid, DROP COLUMN oldsourceid; ALTER TABLE sources DROP COLUMN oldid; ALTER TABLE subcontrols DROP COLUMN oldparentid;"

