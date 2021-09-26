Get-ChildItem  "$psscriptroot/../shared" -Recurse -Include *.ps1 | ForEach-Object {
  & $_.FullName
}

Get-ChildItem  "$psscriptroot/../services" -Recurse -Include *.ps1 | ForEach-Object {
  & $_.FullName
}