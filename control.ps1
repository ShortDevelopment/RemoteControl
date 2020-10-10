$code = '
    using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;
namespace Interopt{
public class SendKeysInteropt
{
    [DllImport("user32.dll", SetLastError = true)]
    public static extern void keybd_event(byte virtualKey, byte scanCode, uint flags, IntPtr extraInfo);
    public const int KEYEVENTF_EXTENDEDKEY = 0x0001; //Key down flag
    public const int KEYEVENTF_KEYUP = 0x0002; //Key up flag
    public static void SendKeys(Keys key){
        keybd_event((byte)key, 0, KEYEVENTF_EXTENDEDKEY, IntPtr.Zero);
        keybd_event((byte)key, 0, KEYEVENTF_KEYUP, IntPtr.Zero);
    }
}}

'
$assemblies = ("System", "System.Core","System.Xml.Linq","System.Data","System.Xml", "System.Data.DataSetExtensions", "Microsoft.CSharp", "System.Windows.Forms")
Add-Type -TypeDefinition  $code -Language CSharp -ReferencedAssemblies $assemblies
Write-Host $args.Length
Write-Host $args
if ($args.Length -eq 0){
    [Interopt.SendKeysInteropt]::SendKeys([System.Windows.Forms.Keys]::MediaPlayPause)
}else{    
    switch($args[0]){
        "PlayPause" {
            [Interopt.SendKeysInteropt]::SendKeys([System.Windows.Forms.Keys]::MediaPlayPause)
        }
        "VolumeUp"{
            [Interopt.SendKeysInteropt]::SendKeys([System.Windows.Forms.Keys]::VolumeUp)
        }
        "VolumeDown"{
            [Interopt.SendKeysInteropt]::SendKeys([System.Windows.Forms.Keys]::VolumeDown)
        }
        "Next"{
            [Interopt.SendKeysInteropt]::SendKeys([System.Windows.Forms.Keys]::MediaNextTrack)
        }
    }
}