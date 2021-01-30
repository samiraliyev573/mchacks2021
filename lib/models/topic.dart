class Topic {
  final int id, numAttempts;
  final String title, desc, date, imgurl, category;

  Topic(
      {this.id,
      this.numAttempts,
      this.title,
      this.desc,
      this.date,
      this.category,
      this.imgurl});
}

// demo data for the app for the results

List<Topic> topics = [
  Topic(
      id: 1,
      numAttempts: 600,
      title: "Pineapple or nah?",
      desc: "Lets see if others like pizza with or without topping?",
      date: "Jan 29, 2021",
      category: "Fun",
      imgurl: "https://img.pikbest.com/01/77/23/20SpIkbEsTcwg.jpg-1.jpg!bw700"),
  Topic(
      id: 2,
      numAttempts: 700,
      title: "Pineapple or nah?",
      desc: "Lets see if others like pizza with or without topping?",
      date: "Jan 29, 2021",
      category: "Informational",
      imgurl: "https://img.pikbest.com/01/77/23/20SpIkbEsTcwg.jpg-1.jpg!bw700"),
  Topic(
      id: 3,
      numAttempts: 800,
      title: "Pineapple or nah?",
      desc: "Lets see if others like pizza with or without topping?",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl:
          "https://i.pinimg.com/originals/a4/f1/f6/a4f1f6c1efdb834471deaae8f77940c8.jpg"),
  Topic(
      id: 4,
      numAttempts: 900,
      title: "Pineapple or nah?",
      desc: "Lets see if others like pizza with or without topping?",
      date: "Jan 29, 2021",
      category: "Politics",
      imgurl: "https://img.pikbest.com/01/77/23/20SpIkbEsTcwg.jpg-1.jpg!bw700")
];
