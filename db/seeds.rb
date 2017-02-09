
# ################################################################################

zara = User.create!(first_name:"Zara", last_name: "Aslam", email:"zara@zara.com", password: "password", phone_number: "5105579120", street_address: "221 7th Street", city:"San Francisco", state: "CA", zip_code: 94105, lang_preference: "spanish", grade_level: 9, user_type: "parent")

rob = User.create!(first_name:"Rob", last_name: "Turner", email:"rob@rob.com", password: "password", phone_number: "9252474748", street_address: "3259 Madera Avenue", city:"San Francisco", state: "CA", zip_code: 94619, lang_preference: "english", grade_level: 10, user_type: "parent")

julia = User.create!(first_name:"Julia", last_name: "Yulak", email:"julia@julia.com", password: "password", phone_number: "4155188406", street_address: "8735 Holbrook Street", city:"Los Angeles", state: "CA", zip_code: 90660, lang_preference: "spanish", grade_level: 10, user_type: "parent")

angie = User.create!(first_name:"Angie", last_name: "Gonzalez", email:"angie@angie.com", password: "password", phone_number: "3102920098", street_address: "2543 Congress Street", city:"San Diego", state: "CA", zip_code: 92110, lang_preference: "spanish", grade_level: 12, user_type: "parent")

arlene = User.create!(first_name:"Arlene", last_name: "Perez", email:"arlene@arlene.com", password: "password", phone_number: "5623221545", street_address: "6504 Pardall Rd", city:"Isla Vista", state: "CA", zip_code: 93117, lang_preference: "spanish", grade_level: 11, user_type: "student")

################################################################################
chat1 = Chat.create!(body:"What is an AP course?", user_id: julia.id)
chat2 = Chat.create!(body:"An AP course is an Advanced Placement Course that provides an exam at the end of the year, and if passed, you receive college credit!", user_id: angie.id)
chat3 = Chat.create!(body:"I can't afford to pay for my child's SAT tests. ", user_id: julia.id)
chat4 = Chat.create!(body:"There are waivers for SAT tests, ask your school counselor!", user_id: angie.id)

################################################################################
general = Topic.create!(title: "General")
sat_prep = Topic.create!(title: "SAT Preparation")
financial_aid = Topic.create!(title: "Financial Aid")
college_discussion = Topic.create!(title: "College Discussion")
################################################################################
message1 = Message.create!(title: "Scholarships",body:"Are there scholarships available for CA schools?", user_id: julia.id, topic_id: financial_aid.id)

message2 = Message.create!(title: "SAT Preparation?",body:"What are some tips for taking the SAT?", user_id: angie.id, topic_id: sat_prep.id)

message3 = Message.create!(title: "SAT Resources",body:"Simple and free resources on Khan Academy for SAT courses!", user_id: arlene.id, topic_id: sat_prep.id)

message4 = Message.create!(title: "Financial Aid",body:"Where can I apply for scholarships and financial aid?", user_id: zara.id, topic_id: financial_aid.id)

message5 = Message.create!(title: "Application Anxiety",body:"Are other people completely freaking out about sending out applications?", user_id: angie.id, topic_id: general.id)

message6 = Message.create!(title: "Bears",body:"I hear that Cal Berkeley is awesome. Is that true?", user_id: rob.id, topic_id: college_discussion.id)

message7 = Message.create!(title: "Bike Tickets at Davis?",body:"UC Davis has some pretty strict rules about riding bikes on campus. Anyone who's visited have any comments about that? Do they really give a lot of bike tickets to students?", user_id: arlene.id, topic_id: college_discussion.id)

message8 = Message.create!(title: "Ultricies Erat?",body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vitae mattis mauris. Vestibulum malesuada ultricies libero ut commodo. Suspendisse gravida semper pellentesque. Aliquam erat volutpat.", user_id: angie.id, topic_id: financial_aid.id)

message9 = Message.create!(title: "Suspenseful Tellus",body:"Suspendisse sagittis ipsum sit amet velit cursus mattis. Phasellus commodo tortor a mattis facilisis. Quisque tempor ligula in tellus molestie ornare.", user_id: arlene.id, topic_id: sat_prep.id)

message10 = Message.create!(title: "Intelligerat Numquam",body:"Lorem ipsum dolor sit amet, mel assum persius meliore ut. Reque numquam est et. Elaboraret intellegebat pri ex. Idque scaevola definiebas ea ius, usu ut iisque equidem placerat. Eu decore delectus vel, id nec diam vivendum.", user_id: zara.id, topic_id: general.id)

message11 = Message.create!(title: "Epicurious",body:"Mea epicurei consulatu an. Ne detraxit percipitur ius. Scripta regione sit ei, per meliore dolores blandit at. No rebum possim reformidans sit, ut phaedrum vulputate est, ad cum consetetur quaerendum.", user_id: julia.id, topic_id: financial_aid.id)

message12 = Message.create!(title: "Phaedrus Posse",body:"Virtute scribentur est at, vis id mazim recteque. Qui verterem corrumpit splendide ex, eum id consul mediocritatem. At quo modo populo probatus. Ne pro esse dicat, et malorum abhorreant usu, ea sea posse prodesset dissentias.", user_id: rob.id, topic_id: college_discussion.id)

message13 = Message.create!(title: "Omni Omnes",body:"Omnes explicari an sit, tempor graeci tractatos nam te, an ius unum ferri. Mei id phaedrum eleifend, his ei tation splendide. Salutandi dignissim cu vis, est ne facer vocent. Inermis dissentiet mei id, per malis paulo cu.", user_id: arlene.id, topic_id: sat_prep.id)

message14 = Message.create!(title: "Vixed Ads",body:"Laboramus delicatissimi ius at, ne vix ipsum oblique gubergren. Alii euripidis percipitur ne cum, quo ex duis dicant omnium, ea mundi utroque verterem sit. Quando omittam vix ad, te solet noster iracundia vim.", user_id: angie.id, topic_id: financial_aid.id)

message15 = Message.create!(title: "Ut Argumentum",body:"Eu vocent blandit pri. Mea eu labore invidunt. Ut soleat alterum argumentum sit, legendos imperdiet splendide ius no. Vis virtute aliquid ancillae ad, pri ex iusto liberavisse. Recteque accommodare deterruisset eos ei, nihil comprehensam sit ne.", user_id: arlene.id, topic_id: zara.id)

message16 = Message.create!(title: "Corvallis anyone?",body:"Lorem ipsum dolor sit amet, auctor mollis amet ut tellus facilisis. Convallis arcu vestibulum congue elit velit, malesuada sagittis suspendisse nec, tincidunt nam ante vestibulum molestie, pellentesque nulla, habitasse varius ligula tortor proin.", user_id: julia.id, topic_id: college_discussion.id)

message17 = Message.create!(title: "Lobortis Robortis",body:"Sit vestibulum in luctus voluptatem, aenean vel vel est interdum nec, ante ac, auctor dolor per erat fringilla, eros sapien cras a. Nulla pede ornare. Duis donec, fusce non urna lobortis nisl sed donec, feugiat sapien sit sem tempor volutpat purus, accumsan cras lectus. Orci at placerat, leo convallis accumsan massa wisi eu nam, blandit est mattis et rhoncus a quis, habitasse duis.", user_id: rob.id, topic_id: sat_prep.id)

message18 = Message.create!(title: "More Dolors",body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel nulla non augue bibendum ultricies. Maecenas bibendum sapien eu lorem semper rutrum. Fusce velit eros, posuere nec felis non, eleifend finibus est. Nullam vel viverra magna. Sed dapibus eu dolor vitae suscipit. Quisque a dui at mi blandit iaculis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas et aliquet nisl.", user_id: arlene.id, topic_id: financial_aid.id)

message19 = Message.create!(title: "Aquarius Rising",body:"Aliquam aliquam nisi vitae lacus rutrum pulvinar. Integer egestas tempus arcu sed interdum. Donec bibendum pellentesque scelerisque. Nulla vel quam ultrices augue hendrerit luctus vel eu purus.", user_id: angie.id, topic_id: general.id)

message20 = Message.create!(title: "The Nam",body:"Nam in lorem augue. Nullam sodales risus finibus blandit pharetra. Ut iaculis at libero id porttitor. Vestibulum lacus neque, placerat non porttitor mattis, vehicula vitae tellus. Cras sit amet ligula in sem cursus pharetra in at justo.", user_id: zara.id, topic_id: college_discussion.id)

message21 = Message.create!(title: "Crass Mollusks",body:"Cras mollis commodo nibh vel tristique. Integer neque est, gravida eu interdum at, volutpat eget ipsum. Proin turpis sem, ultricies sed maximus sed, venenatis a metus. Nam nec lectus pretium ligula efficitur viverra.", user_id: julia.id, topic_id: college_discussion.id)

message22 = Message.create!(title: "Bland Presents",body:"Praesent porta tortor vitae blandit laoreet. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce dapibus tristique ex, ac tincidunt neque interdum sit amet. Vestibulum auctor ultricies semper.", user_id: rob.id, topic_id: college_discussion.id)

message23 = Message.create!(title: "Odio and Garfield",body:"Aliquam gravida, lacus nec tincidunt faucibus, enim magna ullamcorper odio, sit amet vestibulum elit mi quis massa. Pellentesque at pulvinar tortor, vel fringilla est. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.", user_id: arlene.id, topic_id: college_discussion.id)

message24 = Message.create!(title: "Never Nunc",body:"Nunc nunc mauris, blandit sed magna et, tempor iaculis tellus. Aenean in placerat sem, mollis pellentesque quam. Praesent eget turpis velit. Nam convallis risus sapien, quis laoreet felis ultricies sit amet. Integer efficitur egestas enim, quis bibendum augue pellentesque et.", user_id: angie.id, topic_id: sat_prep.id)

message25 = Message.create!(title: "Pallets and Patents",body:"Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla ut tempus lectus, vitae efficitur nunc. Mauris tempus a mauris et mattis.", user_id: zara.id, topic_id: general.id)

message26 = Message.create!(title: "Gaben Steam",body:"Integer a scelerisque erat. Maecenas mauris ante, dapibus sed laoreet eget, suscipit eget dui. Proin tristique congue ultrices. Suspendisse sit amet ipsum justo. Aenean erat lorem, sodales vel ante a, lacinia varius velit. Nullam luctus vestibulum nunc vel suscipit. In ut gravida magna.", user_id: julia.id, topic_id: financial_aid.id)

message27 = Message.create!(title: "Tristique Diablo",body:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi feugiat odio quis velit finibus, ac vulputate est tempor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc lacinia vulputate tortor elementum tempus.", user_id: rob.id, topic_id: college_discussion.id)

message28 = Message.create!(title: "Finibus Phun",body:"Ut tincidunt ornare lobortis. Integer egestas sem ut est dictum, at aliquam mi finibus. Praesent malesuada at nisi vel molestie. In porttitor nisl vel purus lacinia finibus.", user_id: arlene.id, topic_id: general.id)

message29 = Message.create!(title: "Mauris Fortran",body:"Integer in efficitur magna, eu hendrerit justo. Fusce auctor in lorem non ornare. Mauris ac lorem urna. Suspendisse ullamcorper est et mi ullamcorper maximus. Sed arcu orci, pellentesque volutpat condimentum id, gravida quis metus. Aenean vel vestibulum nunc, vitae pellentesque diam.", user_id: angie.id, topic_id: college_discussion.id)

message30 = Message.create!(title: "Integer Fusce",body:"Etiam accumsan odio sit amet dolor eleifend, in sollicitudin quam consequat. Nam venenatis ligula neque, eu accumsan tortor interdum eget. Suspendisse semper vulputate rhoncus. Etiam luctus magna at diam accumsan, id tincidunt ex feugiat. Fusce in ex tortor. Nunc a nisi a risus molestie condimentum. Vestibulum fermentum lacus sit amet risus auctor aliquet.", user_id: zara.id, topic_id: sat_prep.id)

message31 = Message.create!(title: "Pharetra ipsum",body:"Nunc sed metus in massa ultrices sollicitudin egestas eu eros. Duis a augue quis erat porttitor maximus id vitae ex. Quisque non enim pulvinar, tempor quam eget, pharetra ipsum. Cras tincidunt ex sed lorem imperdiet blandit ut id nunc. Nulla at ex nunc. Integer interdum, leo vitae placerat egestas, enim nisi viverra mi, id viverra ipsum nulla ac turpis.", user_id: julia.id, topic_id: general.id)

message32 = Message.create!(title: "Nantoque Pentibus et Magnis?",body:"Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Phasellus ex est, sodales at purus eget, rutrum euismod mauris. Cras varius luctus imperdiet. Vestibulum libero risus, facilisis eget justo eu, sollicitudin condimentum nulla. Aenean fermentum elit id dui pretium, eu ullamcorper velit euismod.", user_id: rob.id, topic_id: college_discussion.id)

message33 = Message.create!(title: "Nunc Bibendum",body:"Duis id nunc bibendum, dignissim ipsum vel, sodales purus. Vestibulum rutrum ornare diam vitae ornare. Suspendisse maximus pretium congue. Vivamus lacinia nunc nunc, nec tempus enim dignissim sed. Nullam id turpis massa. Maecenas vulputate justo augue, ultricies pharetra massa vestibulum ut. Cras nibh ante, sodales quis leo dictum, placerat mollis justo.", user_id: arlene.id, topic_id: college_discussion.id)

message34 = Message.create!(title: "Nulla Risus",body:"Nulla egestas enim vitae sapien rhoncus placerat. Praesent risus est, cursus et tellus eu, dignissim eleifend lectus. Pellentesque id imperdiet ex. Vestibulum non quam velit. Nullam tempus volutpat quam id efficitur. Etiam sagittis enim in ultricies molestie. Sed scelerisque auctor ex ac consequat.", user_id: angie.id, topic_id: general.id)

message35 = Message.create!(title: "Pellentesque",body:"Duis egestas eros non pellentesque placerat. Donec lacinia sodales justo, et tempus eros facilisis eu. Aenean ac libero dignissim, ultrices nulla vel, consectetur augue. Vestibulum dictum lectus sit amet scelerisque cursus. Praesent finibus quam orci, in pellentesque nunc malesuada non. Proin sit amet elementum nisl, ac blandit libero. Mauris in vestibulum tellus.", user_id: zara.id, topic_id: financial_aid.id)

################################################################################
comment1= Comment.create!(body: "Of course, there are both federal and state scholarships available.",message_id: message1.id ,user_id: zara.id)

comment2= Comment.create!(body: "Most schools have links to scholarship sites in their Financial Aid pages. Look there!",message_id: message1.id ,user_id: arlene.id)

comment3= Comment.create!(body: "Thanks for the info!",message_id: message1.id ,user_id: julia.id)

comment4= Comment.create!(body: "Get and use a SAT prep book. It will get you used to the format and typical question structure." ,message_id: message2.id ,user_id: julia.id)

comment5= Comment.create!(body: "Thanks! I didn't know that." ,message_id: message3.id ,user_id: rob.id)

comment6= Comment.create!(body: "There are also lots of videos on Youtube.",message_id: message3.id ,user_id: angie.id)

comment7= Comment.create!(body: "Remember to fill out your FAFSA, that's really important.",message_id: message4.id ,user_id: rob.id)

comment8= Comment.create!(body: "A lot of scholarships have specific application instructions and requirements. Be sure to read them carefully.",message_id: message4.id ,user_id: angie.id)

comment9= Comment.create!(body: "Remember, some scholarships are listed on nonprofit sites. Apply for all that you're eligible for!",message_id: message4.id ,user_id: julia.id)

comment10= Comment.create!(body: "It's definitely a thing. You're not alone. But remember, you can't succeed if you don't try." ,message_id: message5.id ,user_id: rob.id)

comment11= Comment.create!(body: "UC Berkeley is pretty great. Beautiful campus, great professors, wonderful diversity. Go Bears!",message_id: message6.id ,user_id: zara.id)
################################################################################
tag1 = Tag.create!(message_id: message2.id, count:1, title: "Like")
tag2 = Tag.create!(message_id: message2.id, count:1, title: "Study")
tag3 = Tag.create!(message_id: message3.id, count:1, title: "Love")
tag4 = Tag.create!(message_id: message3.id, count:1, title: "Love")
tag5 = Tag.create!(message_id: message1.id, count:1, title: "Scholarships")
tag6 = Tag.create!(message_id: message4.id, count:1, title: "Scholarships")
tag7 = Tag.create!(message_id: message5.id, count:1, title: "Anxiety")
tag8 = Tag.create!(message_id: message5.id, count:1, title: "Applying")
tag9 = Tag.create!(message_id: message6.id, count:1, title: "Bears")
################################################################################


@users = User.all
@users.each do |user|

  user.requirements.create!(subject:"History", years_required: 2, years: 0)
  user.requirements.create!(subject:"English", years_required: 4, years: 0)
  user.requirements.create!(subject:"Math", years_required: 3, years: 0)
  user.requirements.create!(subject:"Science", years_required: 2, years: 0)
  user.requirements.create!(subject:"Language", years_required: 2, years: 0)
  user.requirements.create!(subject:"Arts", years_required: 1, years: 0)
  user.requirements.create!(subject:"Elective", years_required: 1, years: 0)
end




# tips = ["Welcome to fall! Make sure your child meets with the school counselor to discuss college and career options and choose the most-appropriate classes.", "Help your child set goals for the school year. Working toward specific goals helps your child stay motivated and focused.", "Make a plan to check in regularly about schoolwork. If you keep up with your child's tests and assignments, you can celebrate successes and head off problems.", "Talk about extracurricular activities. Getting involved in clubs and other groups is a great way for your child to identify interests and feel engaged in school.", "Start thinking about financial aid. It's not too early to look into types of aid that could help you cover college costs.", "Discuss next year's classes. Make sure your child is challenging him- or herself — and taking the courses college admission officers expect to see.", "Help your child start a college list and decide what matters most to your child when choosing a college.", "See how much you need to save for college. Use the College Savings Calculator  to get an idea of where you are compared with your savings goal.", "Help your child make summer plans. Summer is a great time to explore interests and learn new skills — colleges love that!", "Visit a college campus together. It's a great way to get excited about college.", "Help your child explore career options. He or she can make a list of interests, talents, and favorite activities and start matching them with occupations", "Come up with fun reading ideas. Look for magazines or newspapers your child may like and talk about the books you loved reading when you were in high school.", "Help your child get ready to take the PSAT/NMSQT. Taking the test this fall can help your child prepare for the SAT and get on track for college.", "Has your child takent he PSAT/NMSQT yet? Review the results together.", "Encourage your child to consider taking the SAT Subject Tests. Many college require or recommend taking these tests to get a sense of your child's skills in a certain academic area.", "Discuss next year's classes. Make sure your child will be challenging him- or herself and taking the courses college admission officers expect to see.", "Explore financial aid options. These include grants and scholarships, loans, and work-study programs that can help pay for college costs.", "Many juniors take the SAT in the spring so they can get a head start on planning for college.", "Taking honors courses or college-level courses like Advanced Placement can help your child prepare for college work — colleges love when students take these!"]
#
# tips.each do |tip|
#   Tip.create!(body: tip)
# end
# ################################################################################
# Read SAT locations from csv file
school_file = File.open('./db/school_data.csv', 'r')
school_csv = CSV.parse(school_file, :headers => false)

school_csv.each do |school|
  Sat.create!({date:school[1],

              location_name:school[2],
              address:school[3],
              latitude:school[4].to_f,
              longitude:school[5].to_f})
            end
