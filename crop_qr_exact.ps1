Add-Type -AssemblyName System.Drawing

# --- Telegram Exact QR Crop ---
$tgBitmap = [System.Drawing.Bitmap]::FromFile("d:\Website_Me\Cv-about_me\qr_telegram.png")

# QR Pattern Bounds: X=[114, 358], Y=[371, 616]
$tMinX = 114; $tMaxX = 358; $tMinY = 371; $tMaxY = 616
$tgPad = 16
$cropTX = $tMinX - $tgPad
$cropTY = $tMinY - $tgPad
$tW = ($tMaxX - $tMinX) + ($tgPad * 2)
$tH = ($tMaxY - $tMinY) + ($tgPad * 2)
$tSide = [Math]::Max($tW, $tH)

$tgOut = New-Object System.Drawing.Bitmap($tSide, $tSide)
$g1 = [System.Drawing.Graphics]::FromImage($tgOut)
$g1.Clear([System.Drawing.Color]::White)
$srcRect1 = New-Object System.Drawing.Rectangle($cropTX, $cropTY, $tSide, $tSide)
$g1.DrawImage($tgBitmap, 0, 0, $srcRect1, [System.Drawing.GraphicsUnit]::Pixel)
$g1.Dispose()
$tgBitmap.Dispose()
$tgOut.Save("d:\Website_Me\Cv-about_me\qr_telegram_clean.png", [System.Drawing.Imaging.ImageFormat]::Png)
$tgOut.Dispose()
Write-Output "Telegram QR Cropped: $tSide x $tSide"

# --- WeChat Exact QR Crop ---
$wxBitmap = [System.Drawing.Bitmap]::FromFile("d:\Website_Me\Cv-about_me\qr_wechat.png")
# WeChat QR Pattern Bounds: X=[124, 638], Y=[269, 783]
$wMinX = 124; $wMaxX = 638; $wMinY = 269; $wMaxY = 783
$wxPad = 32
$cropWX = $wMinX - $wxPad
$cropWY = $wMinY - $wxPad
$wW = ($wMaxX - $wMinX) + ($wxPad * 2)
$wH = ($wMaxY - $wMinY) + ($wxPad * 2)
$wSide = [Math]::Max($wW, $wH)

$wxOut = New-Object System.Drawing.Bitmap($wSide, $wSide)
$g2 = [System.Drawing.Graphics]::FromImage($wxOut)
$g2.Clear([System.Drawing.Color]::White)
$srcRect2 = New-Object System.Drawing.Rectangle($cropWX, $cropWY, $wSide, $wSide)
$g2.DrawImage($wxBitmap, 0, 0, $srcRect2, [System.Drawing.GraphicsUnit]::Pixel)
$g2.Dispose()
$wxBitmap.Dispose()
$wxOut.Save("d:\Website_Me\Cv-about_me\qr_wechat_clean.png", [System.Drawing.Imaging.ImageFormat]::Png)
$wxOut.Dispose()
Write-Output "WeChat QR Cropped: $wSide x $wSide"
