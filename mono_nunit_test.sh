#!/usr/bin/env bash
#
#

wget -nc https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
mozroots --import --sync

echo "[INFO] remove bin/Debug/SwaggerClientTest.dll"
rm src/IO.Pesamoni_csharp.Test/bin/Debug/IO.Pesamoni_csharp.Test.dll 2> /dev/null

echo "[INFO] install NUnit runners via NuGet"
wget -nc https://dist.nuget.org/win-x86-commandline/latest/nuget.exe
mozroots --import --sync
mono nuget.exe install src/IO.Pesamoni_csharp.Test/packages.config -o packages

echo "[INFO] Install NUnit runners via NuGet"
mono nuget.exe install NUnit.Runners -Version 2.6.4 -OutputDirectory packages 

echo "[INFO] Build the solution and run the unit test"
xbuild IO.Pesamoni_csharp.sln && \
    mono ./packages/NUnit.Runners.2.6.4/tools/nunit-console.exe src/IO.Pesamoni_csharp.Test/bin/Debug/IO.Pesamoni_csharp.Test.dll
