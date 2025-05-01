import argparse
from kazoo.client import KazooClient
from kazoo.exceptions import NoNodeError

def delete_recursive(zk_client, path):
    """Recursively delete the node and its children."""
    try:
        # List the children of the node
        children = zk_client.get_children(path)
        
        # Recursively delete each child node
        for child in children:
            delete_recursive(zk_client, f"{path}/{child}")
        
        # Now delete the parent node
        zk_client.delete(path)
        print(f"Deleted node: {path}")
    except NoNodeError:
        print(f"Node does not exist: {path}")
    except Exception as e:
        print(f"Error deleting {path}: {e}")

def main():
    # Set up argument parsing
    parser = argparse.ArgumentParser(description="Recursively delete a Zookeeper node and its children.")
    parser.add_argument("topic_name", help="The name of the topic or node to delete in Zookeeper")
    parser.add_argument("--zk_connect", default="localhost:2181", help="Zookeeper connection string (default: localhost:2181)")
    
    # Parse arguments
    args = parser.parse_args()
    
    # Initialize the Kazoo client
    zk_client = KazooClient(hosts=args.zk_connect)
    zk_client.start()  # Start the Zookeeper client connection
    
    # Get the path for the topic (or any other node you want to delete)
    topic_path = f"/{args.topic_name}"  # Adjust path according to your use case
    
    # Perform the recursive deletion
    delete_recursive(zk_client, topic_path)
    
    # Stop the Zookeeper client connection
    zk_client.stop()

if __name__ == "__main__":
    main()

