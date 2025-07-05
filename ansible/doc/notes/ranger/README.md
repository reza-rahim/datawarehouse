
```
wget https://downloads.apache.org/ranger/2.6.0/apache-ranger-2.6.0.tar.gz
tar -xvzf apache-ranger-2.6.0.tar.gz
cd apache-ranger-2.6.0

apt install openjdk-8-jdk maven

update-alternatives --config java
```

#### remove enunciate plugin
```
<!--
<plugin>
  <groupId>com.webcohesion.enunciate</groupId>
  <artifactId>enunciate-maven-plugin</artifactId>
  <version>2.13.2</version>
  <executions>
    <execution>
      <phase>package</phase>
      <goals>
        <goal>docs</goal>
      </goals>
    </execution>
  </executions>
</plugin>
-->
```

#### compile 
```
mvn clean install -DskipTests -Dspotbugs.skip=true -Dmaven.javadoc.skip=true
```

#### Clean any corrupt local mvn repo
```
rm -rf ~/.m2/repository/org/apache/maven/surefire
```
