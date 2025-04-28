#!/bin/bash

# Function to delete nodes recursively
delete_recursive() {
  node=$1
  children=$(/opt/apache-zookeeper-3.9.3-bin/bin/zkCli.sh -server localhost:2181 ls $node | tail -n +2)  # Skip the first line (which is "Done")

  for child in $children; do
    delete_recursive "$node/$child"  # Recursively delete child nodes
  done

  # Now delete the current node
  ./zkCli.sh -server localhost:2181 delete $node
}

# Start deleting from the /spark node
delete_recursive "/spark"

