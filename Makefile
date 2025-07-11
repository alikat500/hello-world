# Makefile for hello-world project

.PHONY: build run clean install test

# Python interpreter
PYTHON = python3

# Build target (in Python, this typically means syntax checking)
build:
	@echo "Building hello-world project..."
	@$(PYTHON) -m py_compile main.py
	@echo "Build successful!"

# Run the application
run:
	@echo "Running hello-world project..."
	@$(PYTHON) main.py

# Install dependencies (if any)
install:
	@echo "No dependencies to install for this simple project"

# Test the application
test: build
	@echo "Testing hello-world project..."
	@$(PYTHON) main.py > /tmp/output.txt
	@if grep -q "Hello Humans!" /tmp/output.txt; then \
		echo "✓ Test passed!"; \
	else \
		echo "✗ Test failed!"; \
		exit 1; \
	fi
	@rm -f /tmp/output.txt

# Clean compiled files
clean:
	@echo "Cleaning build artifacts..."
	@find . -name "*.pyc" -delete
	@find . -name "__pycache__" -type d -exec rm -rf {} +
	@echo "Clean complete!"

# Default target
all: build

# Help target
help:
	@echo "Available targets:"
	@echo "  build   - Compile/check the Python code"
	@echo "  run     - Run the hello-world application"
	@echo "  test    - Run tests"
	@echo "  install - Install dependencies"
	@echo "  clean   - Remove build artifacts"
	@echo "  help    - Show this help message"