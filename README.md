# AUVNET Flutter Internship Assessment

A Flutter-based e-commerce app built using Clean Architecture, BLoC state management, and Supabase backend integration. Dependency injection is handled with GetIt. Splash screen is configured using `flutter_native_splash`.

---

## 📁 Project Structure
```
lib/
├── core/ # App-wide constants, theme, utils, network
├── features/ # Feature-based modules
│ ├── authentication/ # Auth logic and UI
│ ├── home/ # Home screen components
│ └── onboarding/ # Onboarding pages
├── routes/ # App routes and navigation
├── startup/ # DI and app initialization
└── main.dart # Entry point
```

---

## 🔧 Tools & Packages

- **State Management**: `flutter_bloc`
- **Dependency Injection**: `get_it`, `injectable`
- **Backend**: `supabase_flutter`
- **Local Storage**: `hive`, `hive_flutter`
- **Splash Screen**: `flutter_native_splash`
- **Utilities**: `equatable`, `cached_network_image`, `flutter_svg`

---

## 🚀 Getting Started

### 1. Clone the repository

```
git clone https://github.com/yourusername/AUVNET-Flutter-Internship-Assessment.git
cd AUVNET-Flutter-Internship-Assessment
```
2. Install dependencies
```
flutter pub get
```
3. Setup environment variables
Create a .env file at the root:
```
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_key
```
4. Run the app
```
flutter run
```
## ✅ Implemented Features
 - Email-based authentication (login/register/logout)

 - Interactive onboarding flow with skip option

 - Home dashboard with services, ads, and shortcuts

 - Supabase backend integration (auth, DB, storage)

 - Local storage with Hive

 - Native splash screen



## 📄 Supabase Setup
Create a Supabase project

Enable Authentication (email/password)
```
Create these tables in SQL Editor:

CREATE TABLE services (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  img_url TEXT NOT NULL,
  more TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE advertisements (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  img_url TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE discount_codes (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  img_url TEXT NOT NULL,
  created_at TIMESTAMPTZ DEFAULT now()
);
```
## 👤 Author
- Ahmed Eid
- 📧 ahmed.eid159753@gmail.com

This project was created for the AUVNET Flutter Internship Assessment
