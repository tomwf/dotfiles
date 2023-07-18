Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseMove
{
  [DllImport("user32.dll")]
  public static extern bool SetCursorPos(int X, int Y);

  [DllImport("user32.dll")]
  public static extern bool GetCursorPos(out POINT lpPoint);

  [StructLayout(LayoutKind.Sequential)]
  public struct POINT
  {
    public int X;
    public int Y;
  }
}

public class KeyboardSimulator
{
  [DllImport("user32.dll")]
  public static extern bool keybd_event(byte bVk, byte bScan, uint dwFlags, uint dwExtraInfo);
}
"@

function GetCursorPosition {
  $point = New-Object MouseMove+POINT
  [MouseMove]::GetCursorPos([ref]$point) | Out-Null
  return $point
}

function GetRandomInt {
  $randomInt = Get-Random -Minimum 1 -Maximum 101
  return $randomInt
}

while ($true) {
  $currentPos = GetCursorPosition
  $randomInt = GetRandomInt
  $newX = $currentPos.X + $randomInt
  $newY = $currentPos.Y
  [MouseMove]::SetCursorPos($newX, $newY)
  Start-Sleep -Milliseconds 500

  $currentPos = GetCursorPosition
  $randomInt = GetRandomInt
  $newX = $currentPos.X
  $newY = $currentPos.Y + $randomInt
  [MouseMove]::SetCursorPos($newX, $newY)
  Start-Sleep -Milliseconds 500

  $currentPos = GetCursorPosition
  $randomInt = GetRandomInt
  $newX = $currentPos.X - $randomInt
  $newY = $currentPos.Y
  [MouseMove]::SetCursorPos($newX, $newY)
  Start-Sleep -Milliseconds 500

  $currentPos = GetCursorPosition
  $randomInt = GetRandomInt
  $newX = $currentPos.X
  $newY = $currentPos.Y - $randomInt
  [MouseMove]::SetCursorPos($newX, $newY)
  Start-Sleep -Milliseconds 500

  $ESC_KEY = 0x1B
  [KeyboardSimulator]::keybd_event($ESC_KEY, 0, 0, 0)
  Start-Sleep -Milliseconds 100
  [KeyboardSimulator]::keybd_event($ESC_KEY, 0, 2, 0)
}
