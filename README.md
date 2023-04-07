# bootcamp_devops_terraform_mini-projet

## Déploiement d'une infra complète

- Ecrire un module pour créer une instance ec2 utilisant la dernière version de ubuntu bionic (qui s'attachera l'ebs et l'ip publique) dont le tag et le type seront variabilisés
- Ecrire un module pour créer un volume ebs dont la taille sera variabilisée
- Ecrire un module pour une ip publique (qui sattachera la security group)
- Ecrire un module pour créer une security qui ouvrira le 80, 443 et 22
- Créer un dossier app qui va utiliser les 4 modules pour déployer une ec2, bien-sûr vous allez surcharger les variables afin de rendre votre application plus dynamique
- A la fin du déploiement, installer nginx et enregistrer l'ip publique dans un fichier nommé ip_ec2.txt (ces éléments sont à intégrer dans le module ec2)

## Terraform commands:

- **terraform fmt** to Reformat your configuration in the standard style
- **terraform init** to Prepare your working directory for other commands
- **terraform plan** to Show changes required by the current configuration
- **terraform apply** to Create or update infrastructure
- **terraform destroy** to Destroy previously-created infrastructure

### Notes:

To run the commands above, you need to enter to the folder app before

