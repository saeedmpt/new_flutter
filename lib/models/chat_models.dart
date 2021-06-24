class ChatModels {
  final String name;
  final String message;
  final String time;
  final String image;

  ChatModels(this.name, this.message, this.time, this.image);
}

List<ChatModels> dummyChatData = [
  new ChatModels("سعید", "امروز کجا میخوای بری؟", "15:30",
      "https://www.gravatar.com/avatar/49bc54c534a46e1515f7e07118ff3574?s=120&d=identicon&r=PG"),
  new ChatModels("محمد", "شام بریم بیرون؟", "14:35",
      "https://avatars.githubusercontent.com/u/15253456?s=120&v=4"),
  new ChatModels("علی", "کتاب فیزیک رو داری؟", "14:30",
      "https://avatars.githubusercontent.com/u/1269969?s=120&v=4"),
  new ChatModels("محمد حسین", "اپ رو سریع برسون لازمش دارم", "12:30",
      "https://avatars.githubusercontent.com/u/8975114?s=110&v=4"),
  new ChatModels("رضا", "شماره کارتتو بفرست برام.", "10:30",
      "https://avatars.githubusercontent.com/u/682784?s=124&v=4"),
];
