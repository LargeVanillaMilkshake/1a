$compress = @{
  Path = "$ENV:TEMP\wstemp\"
  CompressionLevel = "Fastest"
  DestinationPath = "$ENV:TEMP\wstemp\info.zip"
}
Compress-Archive -Force @compress
