import std.stdio;
import std.file;
import std.string : format;
import std.path : buildPath, dirName;

int main(string[] args)
{
	if(args.length < 2)
	{
		writeln("Usage : ", args[0], " <thumbnails> <directory>");
		writeln("<thumbnails> : file from which to extract the pictures.");
		writeln("<directory> (optional) : directory in which the extracted pictures will be saved. Defaults to the current working directory.");
		return 0;
	}
	auto data = cast(ubyte[]) read(args[1]);
	string output_dir = args.length > 2 ? args[2] : thisExePath.dirName;
	if(!output_dir.exists)
	{
		try
		{
			mkdir(output_dir);
		}
		catch(Exception e)
		{
			writeln("Failed to create directory ", output_dir, " : ", e.msg);
			return 1;
		}
	}
	int start, nth;
	foreach(i; 0 .. data.length - 1)
	{
		if(data[i] == 0xff && data[i + 1] == 0xd8)
		{
			start = i;
		}
		else if(data[i] == 0xff && data[i + 1] == 0xd9)
		{
			std.file.write(buildPath(output_dir, "recovered_%d.jpg".format(nth)), data[start .. i + 2]);
			nth++;
		}
	}
	writeln("Recovered ", nth, " pictures.");
	return 0;
}
//~
