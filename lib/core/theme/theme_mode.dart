import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screentasia/screentasia.dart';
import 'app_colors.dart';

ThemeData getDarkTheme(String lang){
  return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.mainColor,
          foregroundColor: AppColors.mainColor,
          focusColor: AppColors.mainColor,
          iconSize: 25,
          shape: StadiumBorder(
            side: BorderSide(color: AppColors.mainColor),
          )),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.darkBackroundBottomNavigationBarColor,
        surfaceTintColor: AppColors.darkBackroundBottomNavigationBarColor,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 15,
        color: AppColors.greyColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.darkMainTextColor,
        size: 30,
      ),
      useMaterial3: true,
      // fontFamily: Constants.appFontName,
      scaffoldBackgroundColor: AppColors.darkBackroundScreenColor,
      // Colors.black,
      bottomAppBarTheme: const BottomAppBarTheme(color: AppColors.darkBackroundScreenColor
          //  Colors.black
          ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all<double>(7),
        // mainAxisMargin:60,
        trackVisibility: WidgetStateProperty.all<bool>(true),
      ).copyWith(
        thumbColor: WidgetStateProperty.all(
          AppColors.mainColor.withOpacity(0.8),
        ),
        trackColor: WidgetStateProperty.all(
          AppColors.mainColor.withOpacity(0.8),
        ),
      ),

      appBarTheme: AppBarTheme(
        titleTextStyle: lang == "ar"
            ? GoogleFonts.cairo().copyWith(
                fontFamily: GoogleFonts.cairo().fontFamily,
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
              )
            : GoogleFonts.balooBhai2().copyWith(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
              ),

        // GoogleFonts.cairo().copyWith(
        // color: AppColors.darkMainTextColor,
        // fontWeight: FontWeight.bold,
        // fontSize: 19.sp.ap(
        //     adaptivePercentage:
        //         const AdaptivePercentage(tablet: 80, desktop: 60)),
        // ),
        centerTitle: true,
        surfaceTintColor: AppColors.darkBackroundScreenColor,
        foregroundColor: AppColors.darkBackroundScreenColor,
        // Colors.white,
        backgroundColor: AppColors.darkBackroundScreenColor,
        // Colors.black,
        iconTheme: const IconThemeData(color: AppColors.mainColor, size: 30
            //  Color(0xFF0a66a9),
            ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: lang == "ar"
          ? GoogleFonts.cairoTextTheme().copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 15.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.secondeyTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 15.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 16,
                color: AppColors.secondeyTextColor,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
              labelLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
              fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 16,
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
              ),
            
            )
          : GoogleFonts.balooBhai2TextTheme().copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 15.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.secondeyTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 15.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 16,
                color: AppColors.secondeyTextColor,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
              ),
              labelLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 16,
                color: AppColors.darkMainTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),


  datePickerTheme: DatePickerThemeData(
          yearStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          rangePickerHeaderHeadlineStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          rangePickerHeaderHelpStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerHeadlineStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerHelpStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          weekdayStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          dayStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerForegroundColor: AppColors.mainColor,
          backgroundColor: AppColors.darkBackroundBottomNavigationBarColor),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 20,
            color: AppColors.secondeyTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: AppColors.mainColor,
        ),
      ),
    
      // iconTheme: const IconThemeData(color: AppColors.secondeyTextColor
      //     //  Colors.white
      //     ),
      dialogTheme: const DialogTheme(
          backgroundColor: AppColors.darkBackroundContinarColor,
          surfaceTintColor: AppColors.darkBackroundContinarColor
          //  Colors.black
          ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        refreshBackgroundColor: AppColors.darkBackroundScreenColor,
        // Colors.black,
        color: AppColors.secondeyTextColor,
        // Colors.white
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          primary: AppColors.mainColor,
          // const Color(0xFF0a66a9),
          onPrimary: AppColors.darkMainTextColor,
          //  Colors.white,
          secondary: AppColors.darktitleColor,
          //  const Color(0xFF121212),
          onSecondary: AppColors.darkMainTextColor,
          //  Colors.white,
          primaryContainer: AppColors.greyTextColor,
          onPrimaryContainer: Colors.white,
          secondaryContainer: AppColors.darkBackroundContinarColor,
          onSecondaryContainer: AppColors.darkBackroundContinarColor,
          //  onSurface:AppColors.darkMainTextColor,

          // primaryContainer: AppColors.darkBackroundScreenColor,
          // //  const Color(0xFF121212),
          // onPrimaryContainer: AppColors.darktitleColor,
          // // Colors.white.withOpacity(0.7),

          // secondaryContainer: AppColors.darkBackroundContinarColor,
          // Theme.of(context).colorScheme.secondary,
          // onSecondaryContainer: AppColors.greyTextColor.withOpacity(0.1),

          // background
          surface: AppColors.darkBackroundScreenColor,
          // Colors.black,
          onSurface: AppColors.darkMainTextColor,
          // Colors.white,

          // error
          error: AppColors.warningColor
          // Colors.red.shade500
          ),
    );
}

ThemeData getLightTheme(String lang){
  return ThemeData(
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.mainColor,
          foregroundColor: AppColors.mainColor,
          focusColor: AppColors.mainColor,
          iconSize: 25,
          shape: StadiumBorder(
            side: BorderSide(color: AppColors.mainColor),
          )),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.lightBackroundScreenColor,
        surfaceTintColor: AppColors.lightBackroundScreenColor,
      ),
      dividerTheme: const DividerThemeData(
        thickness: 1,
        space: 15,
        color: AppColors.greyColor,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.mainTextColor,
        size: 30,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all<double>(7),
        // mainAxisMargin:60,
        trackVisibility: WidgetStateProperty.all<bool>(true),
      ).copyWith(
        thumbColor: WidgetStateProperty.all(
          AppColors.mainColor.withOpacity(0.8),
        ),
        trackColor: WidgetStateProperty.all(
          AppColors.mainColor.withOpacity(0.8),
        ),
      ),
      useMaterial3: true,

      // fontFamily: Constants.appFontName,
      scaffoldBackgroundColor: AppColors.lightBackroundScreenColor,
      //  Colors.white,

      bottomAppBarTheme:
          const BottomAppBarTheme(color: AppColors.lightBackroundScreenColor
              // Colors.white
              ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: lang == "ar"
            ? GoogleFonts.cairo().copyWith(
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 19.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
              )
            : GoogleFonts.balooBhai2().copyWith(
                color: AppColors.mainColor,
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 19.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
              ),
        centerTitle: true,
        foregroundColor: AppColors.lightBackroundScreenColor,
        //  Colors.black,
        surfaceTintColor: AppColors.lightBackroundScreenColor,
        backgroundColor: AppColors.lightBackroundScreenColor,
        // Colors.white,
        iconTheme: const IconThemeData(color: AppColors.mainColor, size: 30
            // Color(0xFF0a66a9),
            ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      textTheme: lang == "ar"
          ? GoogleFonts.cairoTextTheme().copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainTextColor,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 16,
                color: AppColors.secondeyTextColor,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
              bodyMedium: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
              bodySmall: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
              labelLarge: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 16,
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
                labelSmall: TextStyle(
                fontFamily: GoogleFonts.cairo().fontFamily,
                fontSize: 12,
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              
            )
          : GoogleFonts.balooBhai2TextTheme().copyWith(
              titleLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainTextColor,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 16,
                color: AppColors.secondeyTextColor,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
              ),
              bodyMedium: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
              ),
              bodySmall: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
              ),
              labelLarge: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 14.sp.ap(
                    adaptivePercentage:
                        const AdaptivePercentage(tablet: 80, desktop: 60)),
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              labelMedium: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 16,
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
              labelSmall: TextStyle(
                fontFamily: GoogleFonts.balooBhai2().fontFamily,
                fontSize: 16,
                color: AppColors.mainTextColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
              ),
            ),
            

      datePickerTheme: DatePickerThemeData(
          yearStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          rangePickerHeaderHeadlineStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          rangePickerHeaderHelpStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerHeadlineStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerHelpStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          weekdayStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          dayStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 16,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          headerForegroundColor: AppColors.mainColor,
          backgroundColor: AppColors.lightBackroundScreenColor),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontFamily: lang == "ar"? GoogleFonts.cairo().fontFamily: GoogleFonts.balooBhai2().fontFamily,
            fontSize: 20,
            color: AppColors.mainTextColor.withOpacity(0.8),
            fontWeight: FontWeight.bold,
          ),
          foregroundColor: AppColors.mainColor,
        ),
      ),
    
    
      // iconTheme: const IconThemeData(color: mainTextColor
      //     // Colors.black
      //     ),
      dialogTheme: const DialogTheme(
        backgroundColor: AppColors.lightBackroundScreenColor,
        surfaceTintColor: AppColors.lightBackroundScreenColor,
        // Colors.white
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          refreshBackgroundColor: AppColors.lightBackroundScreenColor,
          //  Colors.white,
          color: AppColors.mainTextColor
          //  Colors.black
          ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
        primary: AppColors.mainColor,
        //  const Color(0xFF0a66a9),
        onPrimary: AppColors.mainTextColor,
        //  Colors.white,
        secondary: AppColors.secondeyTextColor,
        // const Color(0xFFf8f9ff),
        onSecondary: AppColors.greyTextColor,
        // Colors.black,
        primaryContainer: AppColors.greyTextColor,
        onPrimaryContainer: Colors.black,

        secondaryContainer: AppColors.greyColor,
        onSecondaryContainer: AppColors.shimmerLightColor,

        // background
        surface: AppColors.lightBackroundScreenColor,
        //  Colors.white,
        onSurface: AppColors.mainTextColor,
        //  Colors.black,

        // error
        error: AppColors.warningColor,
        // Colors.red.shade500
      ),
    );
    
}