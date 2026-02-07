CTA Java Client

A minimal Java Swing application that connects to a local MySQL server and executes SQL commands.

Prerequisites
- JDK 11+ installed
- MySQL running locally (default: host=127.0.0.1 port=3306)
- MySQL Connector/J (JDBC) jar (download from https://dev.mysql.com/downloads/connector/j/)

Compile
From the `deliverable 4/cta-application/java` directory, assuming the connector jar is named `mysql-connector-java.jar` and lives in the same folder:

```bash
javac -cp .:mysql-connector-java.jar CTAClient.java
```

Run
```bash
java -cp .:mysql-connector-java.jar CTAClient
```

On Windows replace `:` with `;` in the `-cp` classpath argument.

Usage
- On start the app prompts for Host, Port, User, Password and Database.
- Enter credentials (defaults: 127.0.0.1, 3306, root, chicago_cta) and click OK.
- Type SQL in the top text area and click "Execute SQL".
- SELECT results appear in the table; DDL/UPDATE show affected rows.

Security note: This is a minimal demo — do not store plaintext credentials or use in production as-is.
