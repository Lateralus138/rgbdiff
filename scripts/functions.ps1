function BreakLine
{
    param (
        [ValidateScript({ $_.Length -gt 0 })]
        [String]$Character = '-',
        [ValidateScript({ $_ -gt 0 })]
        [Int]$Width = 100,
        [ValidateScript({ $_ -gt 0 })]
        [Int]$Lines = 1
    )
    1..$Lines | ForEach-Object {
        $Character * $Width
    } 
}