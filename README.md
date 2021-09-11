# Subtitle Name Aligner 
Automatically rename the ass/srt files to align with the mkv files' name.
The most media files you torrented wouldn't come with an adorable subtitle (don't talk about BitTorrent/MagnetLink here or ask me about how to find them). You probably downloaded your favorite subs from some websites and unzipped them to the same directory of the media files. Then you were there only to find the sub's name didn't match exactly with the media file's name, which made it hard for the player to identify the subtitles automatically. You might try to rename the subs one by one but they were too many.
This sucks and the tool will get you out of the trouble.
The tool is designed in a non-intrusive way that it only make changes to your files if it's for 100% sure.
## Prerequisites
1. The media files are named of .mkv suffix. Other suffixes can be supported if you know how to modify the script yourself.
2. The subs are in the same directory of the media files. And there must be a (greatest) common substring pattern in the filenames of the media and the sub that only the two of them shares and starts at all the beginning of each filename. 
> + Example 01: a media AAAABBBB.mkv, a corresponding sub AAAACCC.srt, and onother sub AAADEEE.srt. In this case, the media and the corresponding sub has a common subtring pattern "AAAA" that only the two of them shares and starts at the beginning of the filenames, so the tool can help with this case.
> + Example 02: a media AAAABBBB.mkv, a corresponding sub AAACDDD.srt, and onother sub AAAEFFF.srt. In this case, the common substring pattern "AAA" is not shared by the only two of the media and the corresponding sub but also the other sub. So the tool cannot distinguish the files and won't touch them.
> + Example 03: a media ZAAAABBBB.mkv, a corresponding sub AAAACCC.srt, and onother sub AAADEEE.srt. In this case, though the common substring pattern "AAAA" is share by the only two of the media and the corresponding sub, it doesn't start at both the beginning of the two. So the tool cannot distinguish the files and won't touch them.
3. copy the tool to the directory discussed above or make it a searchable cmdlet in your system's PATH.
## Usage
1. Open a PowerShell terminal and `CD` to the directory. Or choose *File -> Open Windows PowerShell -> Open Windows PowerShell* on top of the Windows Explorer.
2. Run this tool `rename-Subtitles.ps1`.
3. Done.
