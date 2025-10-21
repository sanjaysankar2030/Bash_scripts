#!/bin/bash

# === Config ===
PROJECT_NAME=$1
PACKAGE_NAME=$2

if [ -z "$PROJECT_NAME" ] || [ -z "$PACKAGE_NAME" ]; then
  echo "Usage: $0 <project_name> <package.name>"
  exit 1
fi

PACKAGE_PATH=$(echo "$PACKAGE_NAME" | tr '.' '/')

# === Create folders ===
mkdir -p "$PROJECT_NAME"/{src/"$PACKAGE_PATH",bin}

# === Create Main.java ===
cat > "$PROJECT_NAME"/src/"$PACKAGE_PATH"/Main.java <<EOF
package $PACKAGE_NAME;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello from $PACKAGE_NAME!");
    }
}
EOF

# === Create Makefile ===
cat > "$PROJECT_NAME"/Makefile <<EOF
SRC_DIR=src
BIN_DIR=bin
PACKAGE=$PACKAGE_NAME
MAIN_CLASS=Main

# Find all Java source files
SOURCES=\$(shell find \$(SRC_DIR) -name "*.java")

# Default target
all: run

compile:
\tmkdir -p \$(BIN_DIR)
\tjavac -d \$(BIN_DIR) \$(SOURCES)

run: compile
\tjava -cp \$(BIN_DIR) \$(PACKAGE).Main

clean:
\trm -rf \$(BIN_DIR)
EOF

echo "✅ Created pure Java project '$PROJECT_NAME' with package '$PACKAGE_NAME'"

