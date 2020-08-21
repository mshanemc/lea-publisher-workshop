sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --userprefix mobpub --userdomain work.shop
# install mobile publisher managed packages https://help.salesforce.com/articleView?id=branded_apps_playground_getstarted.htm&type=5
sfdx force:package:install --package 04t1I000003RkFQQA0 --publishwait 60 --wait 60
sfdx force:package:install --package 04t1I000003RkFaQAK --publishwait 60 --wait 60
sfdx shane:github:package:install -g mshanemc -r community-boilerplate

sfdx force:source:push
sfdx force:user:permset:assign -n WorkshopPerms
sfdx force:data:record:create --sobjecttype Account --values "Name='Default Partner'"
sfdx shane:user:password:set -g User -l User -p sfdx1234
sfdx force:org:open