#!/usr/bin/env bash
# sync-sln.sh — remove broken projects, then add everything under app/*

SLN=$(find . -type f -name '*sln')

# 1. Remove *all* existing projects
dotnet sln $SLN list \
  | grep .csproj \
  | xargs -I{} dotnet sln $SLN remove "{}" \

# 2. Find & add every .csproj under services/
find . -type f -name '*.csproj' \
  | xargs -I{} dotnet sln $SLN add "{}"
