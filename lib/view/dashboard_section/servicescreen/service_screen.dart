import 'dart:convert';

import 'package:digitalwebber/util/widgets_global/design_template_screen.dart';
import 'package:digitalwebber/view/dashboard_section/homescreen/widgets/card_widget.dart';
import 'package:digitalwebber/util/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key, this.isBack});

  final bool? isBack;
  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  bool isVisible = false;

/*   List _serviceList = [];
// Fetch content from the json file
  Future<void> loadJson() async {
    final String response =
        await rootBundle.loadString('assets/jsonfile/services.json');
    final data = await json.decode(response);
    setState(() {
      _serviceList = data["services"];
    });
  } */

  @override
  void initState() {
    super.initState();

    // loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary2,
      child: Scaffold(
        // backgroundColor: kWhite,
        appBar: widget.isBack == true
            ? AppBar(
                leading: const BackButton(color: kWhite),
                elevation: 5,
                backgroundColor: kPrimary,
                title: customText("Services", color: kWhite),
              )
            : null,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              children: [
                Container(
                    width: double.infinity,
                    // height: 350.h,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[
                          kPrimary,
                          kPrimary2,
                          kPrimary3,
                          kWhite
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    padding: EdgeInsets.all(12.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        customLogo('assets/logo.png', size: 58, onTap: () {}),
                        SizedBox(height: 36.h),
                        customHeading(
                          "“Assumptions are the termites of relationships.”",
                          fontSize: 28.sp,
                        ),
                        SizedBox(height: 8.h),
                        customText('―Henry Winkler.', color: kWhite),
                        /*   customHeading(
                          _serviceList[0]['quotes'],
                          fontSize: 28.sp,
                        ),
                        customText(_serviceList[0]['author']), */
                        SizedBox(height: 24.h),
                        customText('Here We Provide Several Services !!!',
                            fontSize: 18.sp, color: kBlack87),
                      ],
                    )),
                SizedBox(height: 24.h),
                Container(
                    color: kWhite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1),
                        itemCount: serviceList.length,
                        itemBuilder: (context, index) {
                          var item = serviceList[index];
                          return CardWidget(
                            text: item[0].toString(),
                            imageName: item[1].toString(),
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: serviceList,
                                                listItem: webList,
                                                iconList: iconData,
                                              )));
                                  break;
                                case 1:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: serviceList,
                                                listItem: seoList,
                                                iconList: iconData,
                                              )));
                                  break;
                                case 2:
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DesignTemplateScreen(
                                                index: index,
                                                headerData: serviceList,
                                                listItem: smoList,
                                                iconList: iconData,
                                              )));
                                  break;
                                case 3:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DesignTemplateScreen(
                                              index: index,
                                              headerData: serviceList,
                                              listItem: graphicsList,
                                              iconList: iconData,
                                            )),
                                  );
                                  break;
                                case 4:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DesignTemplateScreen(
                                              index: index,
                                              headerData: serviceList,
                                              listItem: videoList,
                                              iconList: iconData,
                                            )),
                                  );
                                  break;
                                case 5:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DesignTemplateScreen(
                                              index: index,
                                              headerData: serviceList,
                                              listItem: mobileList,
                                              iconList: iconData,
                                            )),
                                  );
                                  break;
                                case 6:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DesignTemplateScreen(
                                              index: index,
                                              headerData: serviceList,
                                              listItem: logoList,
                                              iconList: iconData,
                                            )),
                                  );
                                  break;
                                case 7:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DesignTemplateScreen(
                                              index: index,
                                              headerData: serviceList,
                                              listItem: leadList,
                                              iconList: iconData,
                                            )),
                                  );
                                  break;

                                default:
                                  null;
                              }
                            },
                          );
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static const serviceList = [
    [
      "Web Development",
      "assets/sitedata/website.png",
      "Website Development",
      "Website Development",
      "Custom PHP development.Crafting digital experiences that inspire and engage",
    ],
    [
      "SEO",
      "assets/sitedata/seo.png",
      "Search Engine Optimization",
      "The right SEO strategies for your success",
      "Get into the search habit. Every SEO has a story to tell.",
    ],
    [
      "SMO",
      "assets/sitedata/smo.png",
      "Social Media Optimization",
      "SMO is Our Forte",
      "Stay digitally alive with us.Make your brand's digital presence known on social media with the best SMO service for Facebook, Instagram, and Pinterest.",
    ],
    [
      "Graphics Design",
      "assets/sitedata/graphics.png",
      "Graphics Design",
      "Graphics Design is Our Forte",
      "Groundbreaking design service with artistic innovation.The power of imagination is where pixels come alive and dreams take shape.",
    ],
    [
      "Video Editing",
      "assets/sitedata/video.png",
      "Video Editing",
      "Start your video editing",
      "The powerful visuals that move your business forward.",
    ],
    [
      "Mobile",
      "assets/sitedata/mobile.png",
      "Mobile Application",
      "Mobile Application",
      "App development became simpler.In this exciting app development journey, start your own chapter. Every app is a journey to get going.",
    ],
    [
      "Logo Design",
      "assets/sitedata/logo.png",
      "Logo Design",
      "Logo Design is Our Forte",
      "The true identity of your brand. Do more with your designs and creative visionaries. Creating brands to make them stand out.",
    ],
    [
      "Lead Development",
      "assets/sitedata/lead.png",
      "Lead Generation",
      "Lead Generation is Our Forte",
      "One of the biggest challenges of lead generation strategies to grow businesses is getting more customers.To attract the targeted audience, quality content is needed. Quality of the service being provided to drive more traffic and boost sales.",
    ],
  ];
  static const iconData = [
    "assets/homeicon/web1_graphic.png",
    "assets/homeicon/web2_bootstrapping.png",
    "assets/homeicon/web3_optimized.png",
    "assets/homeicon/web4_content.png",
    "assets/homeicon/web5_security.png",
    "assets/homeicon/web6_bug.png"
  ];
  static const webList = [
    [
      "Graphics Interface",
      "A specialization of web design that deals with the controls people use to interact with a website or app, including button displays and gesture controls."
    ],
    [
      "Bootstrapping",
      "The technical part of making a website, focusing on code. Web development is further divided into “front-end” and “back-end,” explained below"
    ],
    [
      "Screen Optimized",
      "The process of making sure content is written in a way that it can reach the largest possible target audience. The process of optimizing content should include keywords."
    ],
    [
      "Content Update",
      "Before you actually start making updates to your site, check your SEO & Add some multimedia elements to your site when you’re updating your website content."
    ],
    [
      "Application Security",
      "The idea of building websites to function as expected, even when they are under attack. The concept involves a collection of security controls engineered into a Web application."
    ],
    [
      "Error/Bug Fixing",
      "Bugs are going to happen, no matter how good the web developers are. It is important to understand the types of bugs in order to focus on the more dangerous process."
    ]
  ];
  static const seoList = [
    [
      "Keyword Research",
      "We prioritise keyword research, which tells us how your customers are finding you and where they're finding your competitors. We provide strategic analysis to identify valuable organic traffic opportunities for your business and website. Our keyword research identifies the queries people use to find relevant websites and pages.",
    ],
    [
      "Competitor Research",
      "We give high priority to the process of identifying the strengths and weaknesses of your and your competitors' SEO. To reach your goal, rather than focusing on marketing strategy, you should focus on SEO strategy. Much like a typical competitive analysis, discover any gaps between you and your competitor with our research.",
    ],
    [
      "Off Page SEO",
      "Optimizing for off-site ranking factors for your valuable business involves improving search engine and user perceptions of your site's popularity, trustworthiness, relevance, and authority.",
    ],
    [
      "On-page SEO",
      "Our on-page SEO services come in a variety of sizes and shapes, all of which are based on data and scientific techniques. Through planning, execution, and reporting, our SEO service involves hands-on technical and strategic support at all stages of the process.",
    ],
    [
      "Content Optimization",
      "With each passing day, assist you in increasing traffic to your website. Enhance it with our tried-and-true content optimization processes developed over a decade of experience, and work on your existing content.",
    ],
  ];
  static const smoList = [
    [
      "Increase Exposure",
      "It is important to have a solid social media following to build a successful business. Twitter, Instagram, and Facebook help boost engagement, reinforce your brand, and improve traffic to your website."
    ],
    [
      "Increase Traffic",
      "Our target is to naturally increase your social media referral traffic. Our strategy that helps you increase your engagement, social media reach, and number of followers will also help get more eyes on your posts and profile and grow brand familiarity."
    ],
    [
      "Generate Leads",
      "Apart from brand awareness and customer service, we are here to generate leads for your concerns. For your business, we value the importance of SMO, and with our strategy, we used it to attract customers and generate more leads."
    ],
    [
      "Increase Engagement",
      "Businesses use marketing strategies because this is key to sales, and social channels allow businesses to interact directly with customers. Our SMO can help you do what you're doing even better, from improving engagement to gaining new followers."
    ],
    [
      "Increase Followers",
      "Several brands are competing for audience attention on social media platforms. Our advanced social media strategy is the most effective way to optimize social media accounts."
    ],
    [
      "Social Media Handling",
      "As a digital marketing strategy, social media handling can be used to increase awareness of new products and services, create a better user experience to connect with customers, and increase the potentiality of your brands."
    ]
  ];
  static const graphicsList = [
    [
      "Promotional Banners",
      "Capture attention with stunning banners that make your brand shine! Elevate your marketing game with our eye-catching banner designs."
    ],
    [
      "Business Card Designs",
      "Your brand's essence with our bespoke business designs, crafted to captivate and leave a lasting impression meticulously tailored to embody your distinct identity."
    ],
    [
      "Icon Making",
      "Crafting exquisite emblems that epitomize individuality. Transforming visions into mesmerizing symbols of distinction."
    ],
    [
      "Business Flyer",
      "Business's potential with best, designed to captivate and convert. Stand out from the crowd with our innovative creative and compelling content."
    ],
    [
      "Posters",
      "Let our creativity bring your vision to life on stunning posters. Elevate your message with our professional poster designs."
    ],
    [
      "Ebook Design",
      "Enhance your experience, creating visually captivating layouts that engage and immerse readers, ensuring a seamless and enjoyable reading experience."
    ]
  ];
  static const videoList = [
    [
      "Film Making",
      "Filmmaking for your specific needs is a trend that is increasing day by day. It has become the most powerful marketing and promotional tool. We create films as per your needs for product marketing."
    ],
    [
      "Advertisement Promo Video",
      "The smart choice for your next video advertisement, made with stunning visuals and brandable templates. Create video advertisements that will get more clicks and increase revenue for your concern. Services are available for businesses of all sizes."
    ],
    [
      "Video Color Grading",
      "Get expert colour grading and colour correction for all types of videos. Our experts in colour correction assist individuals with creative adjustments in transforming their raw footage into cinematic-quality videos. We are in charge of perfectly grading footage in accordance with standards."
    ],
    [
      "Short Promo Video",
      "Choose the promo video that best fits your event, business, and product. A major percentage of customers would rather learn about a product or service through video, and the rest of the marketers say video helps increase their sales."
    ],
    [
      "Corporate Presentation",
      "Modern slide designs not only save time but also provide exclusive, elegant, and unique graphic content. Visually appealing slides get maximum audience attention, which helps them relate to the presenter’s words."
    ],
    [
      "Infographic Video Making",
      "Entertain and inform with exceptional, gorgeous, animated infographics. Ask for a service to become an expert infographic video maker in no time. It's as easy as choosing your preferred template and editing the text. Before you’ve finished your morning coffee, get started with your morning coffee."
    ]
  ];
  static const mobileList = [
    [
      "Custom-made",
      "Our accomplished team of developers create mobile applications that are personalized to meet your specific business requirements. We work assiduously to ensure that the application is tailored to your needs."
    ],
    [
      "User-Centric",
      "We recognize the paramount importance of user experience and design our applications with a user-centric interface. This guarantees that your customers have a seamless experience while using your application."
    ],
    [
      "Cross-Platform",
      "We develop mobile applications that are compatible with both iOS and Android platforms, enabling you to reach a wider audience."
    ],
    [
      "Punctual Delivery",
      "We place a high premium on your time and ensure that your mobile application is developed and delivered within the agreed timeframe."
    ],
    [
      "Competitive Pricing",
      "Our pricing structure is highly competitive and transparent, without any concealed charges. We offer affordable pricing for our services, without compromising on quality."
    ],
    [
      "24/7 Support",
      "We provide round-the-clock support to our esteemed clients, ensuring that their queries are promptly and efficiently addressed."
    ]
  ];
  static const logoList = [
    [
      "Custom Logo",
      "This particularly defines your brand and best reflects your business specifications and expectations. Our team is an expert at delivering customised logo designs."
    ],
    [
      "Pre Made Logo",
      "A wide range of premade logos is a great way to get affordable and quality logo design that can also make your brand unique from the rest."
    ],
    [
      "Illustrative Logo",
      "Creative, colorful, and exquisitely illustrative logos that meet your business needs stand out in the competition."
    ],
    [
      "Iconic Logo",
      "This type specifically symbolises your brand and services among your target audience. Creates a positive impression of your products."
    ],
    [
      "Typography Logo",
      "The typography logo design services will help to drive a more active audience to your business with latest technological tools to create aesthetically pleasing typographic logos."
    ],
    [
      "Wordmark Logo",
      "This specific kind has high recall values to grab the attention of your viewers through fascinating wordmark logo designs and convey your brand message."
    ]
  ];
  static const leadList = [
    [
      "Web-Page Optimization",
      "For sales-specific marketing, knowing which clients or companies have viewed your website is necessary. Later, this information will be given to an owner for a precisely designed follow-up conversation to land more clients through web-page optimization."
    ],
    [
      "Daily website checkups",
      "Not only to make sure the system is running smoothly. For which a weekly routine website scan is crucial. but also to make changes and improve the user interface whenever needed."
    ],
    [
      "Keep Updating Keywords",
      "With similar keywords, you can get your website to rank higher. Using long-tail keywords to structure your web content is a good lead generation strategy tip."
    ],
    [
      "SEO Lead Creation",
      "There are many forms of lead magnets that allow a conversation with the possible clients who are not ready to buy from you yet but can be persuaded."
    ],
    [
      "Blog Set Up",
      "Try to incorporate it into your service and your blog posts as much as you can. Another good way to do that is to keep a keen eye on the feedback you get from customers."
    ],
    [
      "Using Social Media",
      "To generate more leads and drive further traffic, we will advertise your service on different social media channels to promote your business."
    ]
  ];
}
