import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:japaapp/business/blocs/journey/intending_migrant_form_cubit.dart';
import 'package:japaapp/business/snapshot/tabscreen_provider.dart';
import 'package:japaapp/core/constants.dart';
import 'package:japaapp/core/dependence/dependence.dart';

import 'package:japaapp/core/route/app_router.dart';

import 'package:japaapp/core/util/width_constraints.dart';
import 'package:japaapp/presentation/widget/back_button.dart';

import 'package:provider/provider.dart';

@RoutePage()
class DetailNewsScreen extends StatefulWidget implements AutoRouteWrapper {
  const DetailNewsScreen({
    super.key,
  });

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntendingMigrantCubit>(
            create: (context) =>
                getIt<IntendingMigrantCubit>()..intendingMigrant()),
      ],
      child: this,
    );
  }
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return WillPopScope(
      onWillPop: () async {
        BotToast.cleanAll();
        bottomNavCProvider.pageIndex = 0;
        context.router.replaceAll([const TabRoute()]);
        return true;
      },
      child: Scaffold(
          // backgroundColor: Colors.white,
          body: _buildProcessforSectionForIntendingOrNewMigrant()),
    );
  }

  Widget _buildProcessforSectionForIntendingOrNewMigrant() {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackground(),
              SizedBox(height: (Sizing.kSizingMultiple).h),
              WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Column(
                  children: [
                    _buildNewsContentSection(),
                  ],
                ),
              ),
              SizedBox(height: (Sizing.kSizingMultiple).h),
            ],
          ),
        ),
        Positioned(
            top: 40,
            child: WidthConstraint(context).withHorizontalSymmetricalPadding(
                child: Container(child: _buildSalutationSection()))),
      ],
    );
  }

  Widget _buildBackground() {
    return Image.asset(
      'assets/images/newimg.png',
      fit: BoxFit.cover,
    );
  }

  Widget _buildSalutationSection() {
    //var bottomNavCProvider = Provider.of<TabScreenNotifier>(context);
    return const CustomBackButton();
  }

  Widget _buildNewsContentSection() {
    return Container(
      //color: Colors.red,
        width: MediaQuery.sizeOf(context).width ,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: MediaQuery.sizeOf(context).width ,
             // height: 50,
              child: Text(
                "Australia announces intention to reduce migration intake by half in 2 years",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                     
                    ),
      
                //overflow: TextOverflow.ellipsis,
              )),
          SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          Text(
            "2h ago · by Isabella Kwai",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xFF6C7072), fontWeight: FontWeight.w400),
          ),

            SizedBox(
            height: Sizing.kSizingMultiple.h,
          ),
          Text(
            '''Introduction:
In our fast-paced modern world, maintaining good health has become a top priority. One of the key pillars of a healthy lifestyle is adopting a nutritious diet. Eating healthy not only fuels our bodies with essential nutrients but also reduces the risk of chronic diseases and promotes overall well-being. In this article, we will explore the benefits of healthy eating and provide practical tips to help you embark on a journey towards optimal health.

1. Nourishing Your Body: A balanced and nutrient-rich diet is the foundation of good health. It provides the body with the necessary vitamins, minerals, protein, carbohydrates, and healthy fats to function optimally. Incorporate a variety of fruits, vegetables, whole grains, lean proteins, and healthy fats into your meals to ensure you're getting a wide range of nutrients.

2. Disease Prevention:
Eating a healthy diet is closely linked to the prevention of chronic diseases such as obesity, heart disease, diabetes, and certain types of cancer. By focusing on whole foods and minimizing processed foods, you reduce your intake of unhealthy additives, excess sugar, unhealthy fats, and sodium. Instead, opt for natural and unprocessed foods that are packed with nutrients and antioxidants, which help protect your body against illness.

3. Maintaining a Healthy Weight:
A healthy diet plays a crucial role in weight management. Consuming a balanced diet that is rich in fiber, lean protein, and healthy fats helps you feel satiated and reduces the likelihood of overeating. By incorporating portion control and mindful eating habits, you can achieve and maintain a healthy weight, which positively impacts your overall well-being.

4. Boosting Energy Levels:
Ever noticed how your energy levels slump after consuming a heavy, greasy meal? Healthy eating can help combat this. Opting for nutrient-dense foods like whole grains, fruits, and vegetables, and staying hydrated can increase your energy levels, enhance mental clarity, and improve productivity throughout the day.

5. Promoting Mental Health:
The connection between a healthy diet and mental well-being is undeniable. Research suggests that diets high in processed foods and added sugars may increase the risk of depression and anxiety. On the other hand, a diet rich in fruits, vegetables, whole grains, and omega-3 fatty acids, such as those found in fatty fish, may have a positive impact on mental health. Prioritize foods that nourish both your body and mind.

Practical Tips for Healthy Eating:

a. Plan your meals: Take the time to plan your meals and snacks in advance. This helps you make healthier choices and avoid impulsive, unhealthy food options.

b. Shop smart: Fill your pantry and refrigerator with nutritious options. Avoid bringing home sugary snacks and processed foods that can tempt you during moments of weakness.

c. Cook at home: Preparing meals at home gives you control over the ingredients and portion sizes. Experiment with healthy recipes and try new flavors to keep your meals exciting.

d. Practice portion control: Be mindful of portion sizes to avoid overeating. Use smaller plates and bowls to help regulate portion sizes visually.

e. Hydrate adequately: Water is essential for proper bodily functions. Stay hydrated throughout the day by drinking water, herbal teas, or infused water rather than sugary beverages.

f. Enjoy moderation: While a healthy diet is important, it's also essential to enjoy occasional treats in moderation. Allow yourself to indulge occasionally, but maintain balance and portion control.

Conclusion:
Eating healthy is a transformative lifestyle choice that leads to numerous health benefits. By nourishing your body with a diverse array of whole foods and adopting mindful eating habits, you can reduce the risk of chronic diseases, maintain a healthy weight, boost energy levels, and promote mental well-being. Start making small, sustainable''',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: const Color(0xFF0D0D0D), 
                
                ),
          ),
        ],
      ),
    );
  }
}
