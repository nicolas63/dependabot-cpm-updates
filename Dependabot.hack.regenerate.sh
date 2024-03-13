#!/usr/bin/env bash

set -e

# Extract the Include values using sed
includes=$(sed -n 's/.*Include="\(.*\)" Version.*/\1/p' Directory.Packages.props)

# Create the Dependabot.hack.csproj file
cat > Dependabot.hack.csproj << EOL
<Project Sdk="Microsoft.NET.Sdk.Web">

  <!-- This is an auto-generated file by a GH action! -->
  <!-- It's a workaround for dependabot to support Central Package Management (CPM) -->
  <!-- https://github.com/dependabot/dependabot-core/issues/8590 -->
  <PropertyGroup>
    <TargetFramework>net8.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
EOL

# Append the PackageReference lines
for include in $includes; do
	echo "    <PackageReference Include=\"$include\" />" >> Dependabot.hack.csproj
done

# Append the closing tags
cat >> Dependabot.hack.csproj << EOL
  </ItemGroup>

</Project>
EOL
