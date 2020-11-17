class Activities {
  bool run;
  bool bake;
  bool knit;
  bool meditate;
  bool readABook;
  bool makeADiaryEntry;
  bool bubbleBath;
  bool watchAMovie;

  Activities(
      {this.run,
      this.bake,
      this.knit,
      this.meditate,
      this.readABook,
      this.makeADiaryEntry,
      this.bubbleBath,
      this.watchAMovie});

  Activities.fromJson(Map<String, dynamic> json) {
    run = json['run'];
    bake = json['bake'];
    knit = json['knit'];
    meditate = json['meditate'];
    readABook = json['read a book'];
    makeADiaryEntry = json['make a diary entry'];
    bubbleBath = json['bubble bath'];
    watchAMovie = json['watch a movie'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['run'] = this.run;
    data['bake'] = this.bake;
    data['knit'] = this.knit;
    data['meditate'] = this.meditate;
    data['read a book'] = this.readABook;
    data['make a diary entry'] = this.makeADiaryEntry;
    data['bubble bath'] = this.bubbleBath;
    data['watch a movie'] = this.watchAMovie;
    return data;
  }
}

var activities =
[
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": true,
        "knit": false,
        "meditate": false,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": true,
        "knit": true,
        "meditate": true,
        "read a book": false,
        "make a diary entry": false,
        "bubble bath": false,
        "watch a movie": true
    },
    {
        "run": false,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": false,
        "make a diary entry": true,
        "bubble bath": false,
        "watch a movie": false
    },
    {
        "run": true,
        "bake": false,
        "knit": false,
        "meditate": true,
        "read a book": true,
        "make a diary entry": true,
        "bubble bath": true,
        "watch a movie": true
    }
]