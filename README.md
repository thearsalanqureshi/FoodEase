# FoodEase
![FoodEase](https://githu/thearsalanqureshi/FoodEase-Prototype-App-b.com/raw/40a143b8b6afc02636d0b48645690494bab7a8bd/mockup%20foodease.png)

# Project Overview
A food delivery application prototype that demonstrates core user flows including restaurant browsing, menu selection, customization, order tracking, and account management. The prototype showcases a complete visual design system with multiple interconnected screens.

## **Tech Stack**
**Frontend:**
- **Flutter** 
- **Provider / GetX** (Inferred) - Lightweight state management for prototype
- **Google Fonts** - Typography system
- **Flutter SVG** - Vector graphics and icons
- **Flutter ScreenUtil** - Responsive UI adaptation for different screen sizes

**UI Components:**
- **Custom bottom navigation bar** - Home | My Orders | Favorite | Setting
- **Animated containers** - For order status indicators (On Progress)
- **Rating stars** - Interactive 4.8★ display component
- **Chip widgets** - Category filters (Meals, Dinners, Drinks, Fast Food)

**Local Storage:**
- **Shared Preferences** - Store login state and user preferences


**Utilities:**
- **Intl** - Date formatting (29 Dec 2022) and currency ($35.05)
- **URL Launcher** - Social sign-up links (Google, Facebook)


### **Problem Statement**
Food delivery apps often overwhelm users with complex navigation and cluttered interfaces. Users need a streamlined experience from discovery to checkout with clear order status visibility and intuitive menu customization.

### **Solution**
Developed a clean, minimal prototype with focused user flows: location-based restaurant discovery, detailed menu views with ingredient customization, order history tracking, and comprehensive settings management.

### **Key Screens & Flows**

| Screen | Purpose |
|--------|---------|
| **Onboarding** | 6 variations of "The experience of buying food quickly" - value proposition carousel |
| **Login** | Email/password + social sign-in (Google/Facebook) with "Forgot Password" flow |
| **Home** | Location header, promotional banners, category chips, "Hot Deals" horizontal scroll |
| **Menu Detail (Simple)** | Noodles item with price, ingredient add-ons (Mustard, Beef, Onion), notes field |
| **Menu Detail (Expanded)** | Rating (4.8★), calories (124 Kcal), time (15 min), full description, location, price |
| **My Orders** | Order history list with restaurant name, date, price, status badge, details button |
| **Settings** | General settings (Edit Profile, Change Password, Notifications) + Preferences section |

### **UI Component Library**
- **Status Badge:** `[On Progress]` - Visual order state indicator
- **Ingredient Tiles:** Item name + unit (1Grm, 1Slice, 1Clove)
- **Food Cards:** Image + rating + name + price ($9.67)
- **Category Chips:** Meals, Dinners, Drinks, Fast Food
- **Detail Expandable:** "Read More" description toggle

### **Navigation Architecture**
```
Bottom Navigation (4 tabs)
├── Home → Category filters → Menu Detail → Add to Cart
├── My Orders → Order List → Order Details
├── Favorite → Saved items
└── Setting → Profile/Preferences
```

### **Design System**
- **Color Palette:** Clean white backgrounds, accent colors for CTA buttons
- **Typography:** Hierarchical scale (Headers, Subheaders, Body, Metadata)
- **Spacing:** Consistent padding and margin system
- **Iconography:** Bottom nav icons + action indicators
- **Cards:** Rounded corners with subtle elevation

### **Prototype Coverage**
 **Complete user flows demonstrated:**
- Authentication (Login + Social Sign-up)
- Food discovery (Location + Categories + Deals)
- Menu exploration (Simple + Detailed views)
- Order customization (Extra ingredients + Notes)
- Order tracking (Status + History)
- Profile management (Settings sections)

### **Interaction Patterns**
- **Tab navigation** - Instant screen switching
- **Horizontal scroll** - Hot deals carousel
- **Expand/collapse** - Product description
- **Quantity selectors** - Implicit in ingredient add-ons
- **Status indicators** - Color-coded order progress

### **Responsive Considerations**
- Adapts to different device sizes (ScreenUtil implementation)
- Consistent card layouts across screen widths
- Touch-friendly button sizes (minimum 48px height)

### **Key Learnings (Prototype Phase)**
- **Bottom navigation with 4 items** provides optimal thumb reach
- **Dual menu detail views** useful for A/B testing user preferences
- **Status badges** improve order tracking clarity
- **Ingredient customization** should be visually distinct from base item
- **Social login** placement affects conversion (bottom vs. top)

