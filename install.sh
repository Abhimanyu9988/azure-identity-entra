#!/bin/bash

# Set text formatting variables
RED="\033[0;31m"
GREEN="\033[0;32m"
BOLD="\033[1m"
RESET="\033[0m"

# Display a greeting message in red
echo -e "${RED}Hello!! Hope you are doing good. You look beautiful.${RESET}"

# Sleep for 2 seconds
sleep 2

# Ask the user if they want to deploy the Terraform template
read -p "Do you wish to deploy the Terraform template? (yes/no): " choice

if [ "$choice" == "yes" ]; then
  # Clone the GitHub repository
  echo -e "${GREEN}${BOLD}Using default values specified in terraform template. If you wish to edit, Please edit variables.tf${RESET}"
  cd Terraform
  
  # Initialize and apply the Terraform configuration
  terraform init
  terraform apply --auto-approve
else
  echo "No action taken. Goodbye!"
fi
