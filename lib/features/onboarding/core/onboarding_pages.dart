class OnboardingPage {
  final String onboardingStep1Title;
  final String onboardingStep1Description;

  OnboardingPage({
    required this.onboardingStep1Title,
    required this.onboardingStep1Description,
  });
}

List<OnboardingPage> onboardingPages = [
  OnboardingPage(
    onboardingStep1Title: 'all-in-one delivery',
    onboardingStep1Description:
        'Order groceries, medicines, and meals delivered straight to your door',
  ),
  OnboardingPage(
    onboardingStep1Title: 'User-to-User Delivery',
    onboardingStep1Description:
        'Send or receive items from other users quickly and easily',
  ),
  OnboardingPage(
    onboardingStep1Title: 'Sales & Discounts',
    onboardingStep1Description: 'Discover exclusive sales and deals every day',
  ),
];
