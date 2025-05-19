import org.I0Itec.zkclient.ZkClient;
import java.util.List;

public class SecureZkClientDelete {


    public static void main(String[] args) {
        String zkHost = "node1.dw.felicity.net.bd:2281";
        String zkNodePath = "/spark"; // Change as needed

        System.setProperty("zookeeper.clientCnxnSocket", "org.apache.zookeeper.ClientCnxnSocketNetty");
        System.setProperty("zookeeper.client.secure", "true");
        System.setProperty("zookeeper.ssl.trustStore", "/etc/cert.d/javacert.truststore.jks");
        System.setProperty("zookeeper.ssl.trustStorePassword", "changeit");

        // Optional (if mTLS)
        // System.setProperty("zookeeper.ssl.keyStore", "client.keystore.jks");
        // System.setProperty("zookeeper.ssl.keyStorePassword", "changeit");

        ZkClient zkClient = new ZkClient(zkHost, 30000, 30000);
        System.out.println("✅ Connected securely to ZooKeeper at " + zkHost);


        zkClient.close();
    }
}

