class Topic {
  final int id, numAttempts;
  final String title, desc, date, imgurl, category, option1, option2;

  Topic(
      {this.id,
      this.option1,
      this.option2,
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
      title: "Is mass surveillance benefical?",
      desc: "Lets see if the others think mass surveillance benefits humanity?",
      option1: "Mass surveillance",
      option2: "No surveillance",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Surveillance_video_cameras%2C_Gdynia.jpeg/1200px-Surveillance_video_cameras%2C_Gdynia.jpeg"),
  Topic(
      id: 2,
      numAttempts: 700,
      title: "Which type of phone is best?",
      desc: "Lets see if others prefer iPhone or Android?",
      option1: "iPhone",
      option2: "Android",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl: "https://i.ytimg.com/vi/kbeEkwlTeqQ/maxresdefault.jpg"),
  Topic(
      id: 3,
      numAttempts: 800,
      title: "FAANG or Startup?",
      desc: "Assuming the same compensation, where would you rather work?",
      option1: "FAANG",
      option2: "Startup",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl:
          "https://content.thriveglobal.com/wp-content/uploads/2019/08/load-image.jpg"),
  Topic(
      id: 4,
      numAttempts: 900,
      title: "Pineapple or nah?",
      desc: "Lets see if others like pizza with or without topping?",
      option1: "Yes",
      option2: "No",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl: "https://img.pikbest.com/01/77/23/20SpIkbEsTcwg.jpg-1.jpg!bw700"),
  Topic(
      id: 5,
      numAttempts: 1000,
      title: "Which text editor is better?",
      desc: "Lets see if other prefers Vim or Emacs?",
      option1: "Vim",
      option2: "Emacs",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl:
          "https://user-images.githubusercontent.com/1487073/58344409-70473b80-7e0a-11e9-8570-b2efc6f8fa44.png"),
  Topic(
      id: 6,
      numAttempts: 1100,
      title: "Do you need a degree in tech?",
      desc: "Lets see if other prefers going to university or not",
      option1: "Worth it",
      option2: "Not worth it",
      date: "Jan 29, 2021",
      category: "Technology",
      imgurl:
          "https://www.princeton.edu//sites/default/files/images/2017/06/20060425_NassauHall_JJ_IMG_5973.jpg"),
  Topic(
      id: 7,
      numAttempts: 1100,
      title: "Is a Hot dog a sandwich?",
      desc: "The age old debate ",
      option1: "Yes",
      option2: "No",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl:
          "https://www.jocooks.com/wp-content/uploads/2014/07/smoked-salmon-sandwiches-1.jpg"),
  Topic(
      id: 8,
      numAttempts: 1100,
      title: "Sunnyside up or easy over eggs?",
      desc: "Lets see what the other prefers",
      option1: "Sunnyside up",
      option2: "Easy over",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl: "https://bluejeanchef.com/uploads/2019/04/Eggs-1280-.jpg"),
  Topic(
      id: 9,
      numAttempts: 1100,
      title: "Grizzly bear vs Gorilla",
      desc: "Which animal do you think would win a fight?",
      option1: "Grizzly bear",
      option2: "Gorilla",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl:
          "https://www.sciencenewsforstudents.org/wp-content/uploads/2019/11/051618_SM_animal-weapon_feat.jpg"),
  Topic(
      id: 10,
      numAttempts: 1100,
      title: "Are Dogs better than Cats?",
      option1: "Dogs",
      option2: "Cats",
      desc: "Which animal do you think is the betteR?",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl:
          "https://images2.minutemediacdn.com/image/upload/c_crop,h_835,w_1254,x_1,y_0/v1554995050/shape/mentalfloss/516438-istock-637689912.jpg?itok=SkYIK_Ob"),
  Topic(
      id: 11,
      numAttempts: 1100,
      title: "Is Minecraft overated?",
      option1: "Yes",
      option2: "No",
      desc: "The video game Minecraft, is it worthy of the praise?",
      date: "Jan 29, 2021",
      category: "Random",
      imgurl:
          "https://cdn.mos.cms.futurecdn.net/qHFzGKFBz7kvxiVyjoe6JJ-970-80.jpg.webp"),
];
