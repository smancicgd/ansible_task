#!/bin/bash
TEMPLATE_FILE="./gcp_compute_template.yml"
INVENTORY_FILE="./gcp_compute.yml"

envsubst < "$TEMPLATE_FILE" > "$INVENTORY_FILE"

ansible-inventory -i "$INVENTORY_FILE" --list