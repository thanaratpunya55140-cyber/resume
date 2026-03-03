$http = [System.Net.HttpListener]::new()
$http.Prefixes.Add('http://+:3000/')
$http.Start()
Write-Host 'Server running at http://localhost:3000' -ForegroundColor Green
while ($http.IsListening) {
    $ctx = $http.GetContext()
    $localPath = $ctx.Request.Url.LocalPath
    $p = if ($localPath -eq '/') { 'D:\Resume\nuclear-infographic.html' } else { 'D:\Resume' + $localPath }
    $r = $ctx.Response
    if (Test-Path $p -PathType Leaf) {
        $ext = [IO.Path]::GetExtension($p)
        $r.ContentType = switch ($ext) {
            '.html' { 'text/html; charset=utf-8' }
            '.css'  { 'text/css' }
            '.js'   { 'application/javascript' }
            '.png'  { 'image/png' }
            '.jpg'  { 'image/jpeg' }
            default { 'application/octet-stream' }
        }
        $b = [IO.File]::ReadAllBytes($p)
        $r.ContentLength64 = $b.Length
        $r.OutputStream.Write($b, 0, $b.Length)
    } else {
        $r.StatusCode = 404
    }
    $r.Close()
}
