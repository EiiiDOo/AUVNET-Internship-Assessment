# AUVNET Flutter Internship Assessment

A Flutter-based e-commerce app built using Clean Architecture, BLoC state management, and Supabase backend integration. Dependency injection is handled with GetIt. Splash screen is configured using `flutter_native_splash`.

---
## - Screen Shots
<img src="https://github.com/user-attachments/assets/29ee7ed8-4e49-45c7-a59c-df61f0eb793f" alt="WhatsApp Image 0" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/4e9d8cd0-e2d4-43a9-b8c0-052ecdd60734" alt="WhatsApp Image 1" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/65b257de-8cbe-4cc9-9a29-754876dfd4e7" alt="WhatsApp Image 2" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/79ac429a-0f2d-449e-9de6-6b0a0896e75e" alt="WhatsApp Image 3" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/e77895cc-a175-4146-8a87-0c66cb26cbf2" alt="WhatsApp Image 4" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/5b3bf6fd-5f93-4301-b338-f55cc25bd853" alt="WhatsApp Image 5" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/1a8a41e7-1407-4c30-b1a5-1a14d5d2289b" alt="WhatsApp Image 6" width="200" style="margin:10"/>
<img src="https://github.com/user-attachments/assets/b708f5ab-7cb8-48c5-b3c8-38ad114b52a4" alt="WhatsApp Image 7" width="200" style="margin:10"/>


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
