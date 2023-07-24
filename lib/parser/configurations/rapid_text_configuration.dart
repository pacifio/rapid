import 'package:flutter/material.dart';

class RapidTextSizeMetrics {
  double fromString(String pixel) {
    if (pixel == "xs") {
      return 12.0;
    } else if (pixel == "sm") {
      return 14.0;
    } else if (pixel == "base") {
      return 16.0;
    } else if (pixel == "lg") {
      return 18.0;
    } else if (pixel == "xl") {
      return 20.0;
    } else if (pixel == "2xl") {
      return 24.0;
    } else if (pixel == "3xl") {
      return 30.0;
    } else if (pixel == "4xl") {
      return 36.0;
    } else if (pixel == "5xl") {
      return 48.0;
    } else if (pixel == "6xl") {
      return 60.0;
    } else if (pixel == "7xl") {
      return 72.0;
    } else if (pixel == "8xl") {
      return 96.0;
    } else if (pixel == "9xl") {
      return 128.0;
    }

    return 16.0;
  }
}

class RapidLineHeightSpacingMetrics {
  double fromString(String size) {
    if (size == "3") {
      return 0.3;
    } else if (size == "4") {
      return 0.4;
    } else if (size == "5") {
      return 0.5;
    } else if (size == "6") {
      return 0.6;
    } else if (size == "7") {
      return 0.7;
    } else if (size == "8") {
      return 0.8;
    } else if (size == "9") {
      return 0.9;
    } else if (size == "10") {
      return 1.0;
    } else if (size == "none") {
      return 0.0;
    } else if (size == "tight") {
      return 0.6;
    } else if (size == "snug") {
      return 0.8;
    } else if (size == "normal") {
      return 1.0;
    } else if (size == "relaxed") {
      return 1.5;
    } else if (size == "loose") {
      return 1.8;
    }

    return 16.0;
  }
}

class RapidLetterSpacingMetrics {
  double fromString(String size) {
    if (size == "tighter") {
      return -0.8;
    } else if (size == "tight") {
      return -0.4;
    } else if (size == "normal") {
      return 0.0;
    } else if (size == "wide") {
      return 0.4;
    } else if (size == "wider") {
      return 0.8;
    } else if (size == "widest") {
      return 1.6;
    }

    return 0.0;
  }
}

class RapidFontWeightMetrics {
  FontWeight fromString(String metrics) {
    if (metrics == "thin") {
      return FontWeight.w100;
    } else if (metrics == "extralight") {
      return FontWeight.w200;
    } else if (metrics == "light") {
      return FontWeight.w300;
    } else if (metrics == "normal") {
      return FontWeight.w400;
    } else if (metrics == "medium") {
      return FontWeight.w500;
    } else if (metrics == "semibold") {
      return FontWeight.w600;
    } else if (metrics == "bold") {
      return FontWeight.w700;
    } else if (metrics == "extrabold") {
      return FontWeight.w800;
    } else if (metrics == "black") {
      return FontWeight.w900;
    }

    return FontWeight.normal;
  }
}

class RapidTextConfigurations {
  static const List<String> acceptedTextColors = [
    // solid colors

    // no variants
    "text-white",
    "text-black",
    "text-transparent",

    // with variants
    "text-amber",
    "text-blue",
    "text-blackgrey",
    "text-brown",
    "text-cyan",
    "text-deeporange",
    "text-deeppurple",
    "text-green",
    "text-grey",
    "text-indigo",
    "text-lightblue",
    "text-lightgreen",
    "text-lime",
    "text-orange",
    "text-pink",
    "text-purple",
    "text-red",
    "text-teal",
    "text-yellow",

    // amber
    "text-amber-50",
    "text-amber-100",
    "text-amber-200",
    "text-amber-300",
    "text-amber-400",
    "text-amber-500",
    "text-amber-600",
    "text-amber-7000",
    "text-amber-800",
    "text-amber-900",

    // blue
    "text-blue-50",
    "text-blue-100",
    "text-blue-200",
    "text-blue-300",
    "text-blue-400",
    "text-blue-500",
    "text-blue-600",
    "text-blue-7000",
    "text-blue-800",
    "text-blue-900",

    // amber
    "text-bluegrey-50",
    "text-bluegrey-100",
    "text-bluegrey-200",
    "text-bluegrey-300",
    "text-bluegrey-400",
    "text-bluegrey-500",
    "text-bluegrey-600",
    "text-bluegrey-7000",
    "text-bluegrey-800",
    "text-bluegrey-900",

    // brown
    "text-brown-50",
    "text-brown-100",
    "text-brown-200",
    "text-brown-300",
    "text-brown-400",
    "text-brown-500",
    "text-brown-600",
    "text-brown-7000",
    "text-brown-800",
    "text-brown-900",

    // cyan
    "text-cyan-50",
    "text-cyan-100",
    "text-cyan-200",
    "text-cyan-300",
    "text-cyan-400",
    "text-cyan-500",
    "text-cyan-600",
    "text-cyan-7000",
    "text-cyan-800",
    "text-cyan-900",

    // deeporange
    "text-deeporange-50",
    "text-deeporange-100",
    "text-deeporange-200",
    "text-deeporange-300",
    "text-deeporange-400",
    "text-deeporange-500",
    "text-deeporange-600",
    "text-deeporange-7000",
    "text-deeporange-800",
    "text-deeporange-900",

    // deeppurple
    "text-deeppurple-50",
    "text-deeppurple-100",
    "text-deeppurple-200",
    "text-deeppurple-300",
    "text-deeppurple-400",
    "text-deeppurple-500",
    "text-deeppurple-600",
    "text-deeppurple-7000",
    "text-deeppurple-800",
    "text-deeppurple-900",

    // green
    "text-green-50",
    "text-green-100",
    "text-green-200",
    "text-green-300",
    "text-green-400",
    "text-green-500",
    "text-green-600",
    "text-green-7000",
    "text-green-800",
    "text-green-900",

    // grey
    "text-grey-50",
    "text-grey-100",
    "text-grey-200",
    "text-grey-300",
    "text-grey-400",
    "text-grey-500",
    "text-grey-600",
    "text-grey-7000",
    "text-grey-800",
    "text-grey-900",

    // indigo
    "text-indigo-50",
    "text-indigo-100",
    "text-indigo-200",
    "text-indigo-300",
    "text-indigo-400",
    "text-indigo-500",
    "text-indigo-600",
    "text-indigo-7000",
    "text-indigo-800",
    "text-indigo-900",

    // lightblue
    "text-lightblue-50",
    "text-lightblue-100",
    "text-lightblue-200",
    "text-lightblue-300",
    "text-lightblue-400",
    "text-lightblue-500",
    "text-lightblue-600",
    "text-lightblue-7000",
    "text-lightblue-800",
    "text-lightblue-900",

    // lightgreen
    "text-lightgreen-50",
    "text-lightgreen-100",
    "text-lightgreen-200",
    "text-lightgreen-300",
    "text-lightgreen-400",
    "text-lightgreen-500",
    "text-lightgreen-600",
    "text-lightgreen-7000",
    "text-lightgreen-800",
    "text-lightgreen-900",

    // lime
    "text-lime-50",
    "text-lime-100",
    "text-lime-200",
    "text-lime-300",
    "text-lime-400",
    "text-lime-500",
    "text-lime-600",
    "text-lime-7000",
    "text-lime-800",
    "text-lime-900",

    // orange
    "text-orange-50",
    "text-orange-100",
    "text-orange-200",
    "text-orange-300",
    "text-orange-400",
    "text-orange-500",
    "text-orange-600",
    "text-orange-7000",
    "text-orange-800",
    "text-orange-900",

    // pink
    "text-pink-50",
    "text-pink-100",
    "text-pink-200",
    "text-pink-300",
    "text-pink-400",
    "text-pink-500",
    "text-pink-600",
    "text-pink-7000",
    "text-pink-800",
    "text-pink-900",

    // purple
    "text-purple-50",
    "text-purple-100",
    "text-purple-200",
    "text-purple-300",
    "text-purple-400",
    "text-purple-500",
    "text-purple-600",
    "text-purple-7000",
    "text-purple-800",
    "text-purple-900",

    // red
    "text-red-50",
    "text-red-100",
    "text-red-200",
    "text-red-300",
    "text-red-400",
    "text-red-500",
    "text-red-600",
    "text-red-7000",
    "text-red-800",
    "text-red-900",

    // teal
    "text-teal-50",
    "text-teal-100",
    "text-teal-200",
    "text-teal-300",
    "text-teal-400",
    "text-teal-500",
    "text-teal-600",
    "text-teal-7000",
    "text-teal-800",
    "text-teal-900",

    // yellow
    "text-yellow-50",
    "text-yellow-100",
    "text-yellow-200",
    "text-yellow-300",
    "text-yellow-400",
    "text-yellow-500",
    "text-yellow-600",
    "text-yellow-7000",
    "text-yellow-800",
    "text-yellow-900",
  ];

  static const List<String> acceptedFontWeights = [
    "font-thin",
    "font-extralight",
    "font-light",
    "font-normal",
    "font-medium",
    "font-semibold",
    "font-bold",
    "font-extrabold",
    "font-black",
  ];

  static const List<String> acceptedTextSizes = [
    "text-xs",
    "text-sm",
    "text-base",
    "text-lg",
    "text-xl",
    "text-2xl",
    "text-3xl",
    "text-4xl",
    "text-5xl",
    "text-6xl",
    "text-7xl",
    "text-8xl",
    "text-9xl",
  ];

  static const List<String> acceptedTextDecorations = [
    "underline",
    "line-through",
  ];

  static const List<String> acceptedTextAlignments = [
    "text-left",
    "text-right",
    "text-center",
    "text-start",
    "text-end",
    "text-justify"
  ];

  static const List<String> acceptedLetterSpacing = [
    "tracking-tighter",
    "tracking-tight",
    "tracking-normal",
    "tracking-wide",
    "tracking-wider",
    "tracking-widest",
  ];

  static const List<String> acceptedLineHeight = [
    "leading-3",
    "leading-4",
    "leading-5",
    "leading-6",
    "leading-7",
    "leading-8",
    "leading-9",
    "leading-10",
    "leading-none",
    "leading-tight",
    "leading-snug",
    "leading-normal",
    "leading-relaxed",
    "leading-loose",
  ];

  static const List<String> acceptedTextTransforms = [
    "uppercase",
    "lowercase",
    "capitalize",
    "normal-case"
  ];

  static final List<String> acceptedStyles =
      RapidTextConfigurations.acceptedTextColors +
          RapidTextConfigurations.acceptedFontWeights +
          RapidTextConfigurations.acceptedTextSizes +
          RapidTextConfigurations.acceptedTextDecorations +
          RapidTextConfigurations.acceptedTextAlignments +
          RapidTextConfigurations.acceptedLetterSpacing +
          RapidTextConfigurations.acceptedLineHeight +
          acceptedTextTransforms;
}
