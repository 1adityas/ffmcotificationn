String link = "https://www.youtube.com/watch?v=3m92Gh8dDHI";
var jugad = [
  [1, 2, 3],
  [2, 3, 4]
];
String linkName = 'No class';
// String name = "No class";

Map<String, String> hashtable = {
  "chill":
      "https://cache.lovethispic.com/uploaded_images/242927-Just-Chill-Out.jpg",
  "Dip": "https://meet.google.com/lookup/hw6zi4pgnu?authuser=1&hs=179",
  "CD_Lab": "https://meet.google.com/lookup/dwu4dxexws",
  "DBMS": "https://meet.google.com/lookup/f4ssgkw4zw",
  "Employ_Skills": "https://meet.google.com/sxd-dbwi-rny",
  "AI_LAB": "https://meet.google.com/lookup/e4usu5shw5",
  "HPC": "https://meet.google.com/lookup/hlvldnzh2c",
  "Comprehension": "https://meet.google.com/lookup/fkdunojrfx",
  "FiberOptics": "https://meet.google.com/lookup/bot3dx7irh",
  "MOOC": "https://meet.google.com/lookup/fu75y63g3o",
  "AI": "https://meet.google.com/lookup/dh2263iaer",
  "Competitive_skills": "https://meet.google.com/lookup/cizbohpwv7",
  "Indian_Art": "https://meet.google.com/lookup/fp6y6zdtsf",
  "NRA": "https://meet.google.com/lookup/bzy3ciecsv"
};

String Dip = "https://meet.google.com/lookup/hw6zi4pgnu?authuser=1&hs=179";
String CD_Lab = "https://meet.google.com/lookup/dwu4dxexws";
String HPC = "https://meet.google.com/lookup/hlvldnzh2c";
String Comprehension = "https://meet.google.com/lookup/fkdunojrfx";
String FiberOptics = "https://meet.google.com/lookup/bot3dx7irh";
String MOOC = "https://meet.google.com/lookup/fu75y63g3o";
String AI_LAB = "https://meet.google.com/lookup/dh2263iaer";
String Employ_Skills = "https://meet.google.com/sxd-dbwi-rny";
String DBMS = "https://meet.google.com/lookup/f4ssgkw4zw";
String AI = "https://meet.google.com/lookup/fbyfl7jilv";
String Competitive_skills = "https://meet.google.com/lookup/cizbohpwv7";
String Indian_Art = "https://meet.google.com/lookup/fp6y6zdtsf";
String NRA = "https://meet.google.com/lookup/bzy3ciecsv";

var table = [
  ["chill", "chill", "chill", "chill", "chill", "chill", "chill"],
  ["chill", "Dip", "CD_Lab", "AI", "NRA", "DBMS", "Indian_Art"],
  ["chill", "NRA", "DBMS", "FiberOptics", "Indian_Art", "CD_Lab", "chill"],
  ["chill", "Dip", "Employ_Skills", "chill", "DBMS", "AI_LAB", "CD_Lab"],
  ["chill", "NRA", "Comprehension", "FiberOptics", "chill", "MOOC", "AI_LAB"],
  ["chill", "AI", "CD_Lab", "DBMS", "Dip", "Competitive_skills", "FiberOptics"],
];

// Map<int,String> hashtable ={0:"https://cache.lovethispic.com/uploaded_images/242927-Just-Chill-Out.jpg",1:};
int weekCondition() {
  //to calculate week number
  int w = DateTime.now().weekday;
  if (w == 6 || w == 7)
    return 0;
  else
    return w;
}

int timeCondition() {
  int h = DateTime.now().hour;
  int m = DateTime.now().minute;
  int time = h * 100 + m;
  // print(time);
  return hashTime(time);
  // return time;
}

int hashTime(int a) {
  //return the hashing key of time table of a day
  if (a < 910 || a > 1620)
    return 0;
  else {
    if (a < 1010)
      return 1;
    else if (a < 1100 && a >= 1010)
      return 2;
    else if (a < 1200 && a >= 1110)
      return 3;
    else if (a < 1300 && a >= 1210)
      return 4;
    else if (a < 1530 && a >= 1350)
      return 5;
    else if (a < 1620 && a >= 1530)
      return 6;
    else
      return 0;
  }
}

String meetLink(int a, int b) {
  return "";
}

void main(List<String> args) {
  // return 1;
}
