name: Go

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - name: Check out code
        uses: actions/checkout@v3

      - name: Setup Go
        uses: actions/setup-go@v5
        with:
          go-version: '1.21.x'

      - name: Install dependencies
        run: go mod tidy
        working-directory: ./go.mod
        
      - name: Build
        run: go build -v ./...
        working-directory: ./go.mod
        
      - name: Run Tests
        run: go test -v ./...
        working-directory: ./go.mod
