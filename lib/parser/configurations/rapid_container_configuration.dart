library rapid;

class RapidContainerConfigurations {
  static const List<String> acceptedBackgroundColors = [
    "bg-white",
    "bg-transparent",

    // gray
    "bg-gray-50",
    "bg-gray-100",
  ];
  static const List<String> acceptedBorderColors = [
    "border-black",
  ];

  static const List<String> acceptedSpacing = [
    "p-0",
  ];
  static const List<String> acceptedShadows = [
    "shadow-xs",
  ];
  static const List<String> acceptedRadius = [
    "radius-xs",
  ];
  static const List<String> acceptedBorders = [
    "border-black",
  ];

  static final List<String> acceptedStyles =
      RapidContainerConfigurations.acceptedBackgroundColors +
          RapidContainerConfigurations.acceptedBorderColors +
          RapidContainerConfigurations.acceptedSpacing +
          RapidContainerConfigurations.acceptedShadows +
          RapidContainerConfigurations.acceptedRadius +
          RapidContainerConfigurations.acceptedBorders;
}
