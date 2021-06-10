class Category {
  String name;
  String backgroundPath;
  List<ItemsFashion> items;
  Category(
      {required this.name, required this.backgroundPath, required this.items});
}

var CategoryList = [
  Category(
      name: "Woman Fashion",
      backgroundPath: "images/female.jpg",
      items: womanItems),
  Category(
      name: "Man Fashion", backgroundPath: "images/man.jpg", items: manItems),
  Category(
      name: "Kids Fashion",
      backgroundPath: "images/kids.jpg",
      items: kidsItems),
  Category(
      name: "Bag & Shoes",
      backgroundPath: "images/bag and shoes.jpg",
      items: bagAndShoes),
  Category(
      name: "Accessories",
      backgroundPath: "images/acc.jpg",
      items: accessories),
];

class ItemsFashion {
  String name;
  String description;
  double price;
  String imagePath;
  String category;
  String color;
  String get getCategory => this.category;

  set setCategory(String category) => this.category = category;

  get getColor => this.color;

  set setColor(color) => this.color = color;
  String get getName => this.name;

  set setName(String name) => this.name = name;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  get getPrice => this.price;

  set setPrice(price) => this.price = price;

  ItemsFashion(
      {required this.name,
      required this.description,
      required this.price,
      required this.imagePath,
      required this.category,
      required this.color});
}

var womanItems = [
  ItemsFashion(
    name: "DIAMOND JACQUARD KNIT TOP",
    description: "V-NECK TOP WITH SPAGHETTI STRAPS.",
    price: 29.90,
    imagePath: "images/f1.webp",
    category: "Woman",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "FLOWY SHIRT",
    description:
        "SHIRT WITH LAPEL COLLAR AND LONG SLEEVES WITH CUFFS. FRONT BUTTON CLOSURE.",
    price: 39.90,
    imagePath: "images/f2.webp",
    category: "Woman",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "FLOWY SHIRT",
    description:
        "SHIRT WITH LAPEL COLLAR AND LONG SLEEVES WITH CUFFS. FRONT BUTTON CLOSURE.",
    price: 39.90,
    imagePath: "images/f2.webp",
    category: "Woman",
    color: "Multi-COlor",
  )
];

var manItems = [
  ItemsFashion(
    name: "CONTRASTING STRIPED BLAZER LIMITED EDITION",
    description:
        "RELAXED FIT BLAZER MADE WITH LIGHTWEIGHT COTTON FABRIC. NOTCHED LAPEL COLLAR. LONG",
    price: 149.0,
    imagePath: "images/m1.webp",
    category: "Man",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "STRIPED SWEATER LIMITED EDITION",
    description:
        "SWEATER WITH ADJUSTABLE HOODED COLLAR. LONG SLEEVES. FRONT POUCH POCKET. CONTRASTING RIB",
    price: 119.0,
    imagePath: "images/m2.webp",
    category: "Man",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "LIMITED EDITION POCKET SHIRT",
    description:
        "FULL CUT SHIRT MADE OF COTTON FABRIC. SPREAD COLLAR AND SHORT SLEEVES. PATCH POCKETS AT CHEST",
    price: 69.90,
    imagePath: "images/m3.webp",
    category: "Man",
    color: "Multi-COlor",
  ),
];

var kidsItems = [
  ItemsFashion(
    name: "STRIPED T-SHIRT",
    description:
        "ROUND NECK SHORT SLEEVE T-SHIRT WITH SEAM DETAIL. BACK LABEL APPLIQUÉ.",
    price: 12.90,
    imagePath: "images/k1.webp",
    category: "Girl Kids",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "BLEACHED DESTROYED SOFT DENIM SHORTS",
    description:
        "SOFT DENIM SHORTS WITH ADJUSTABLE INTERIOR WAISTBAND AND FRONT BUTTON CLOSURE, SNAP",
    price: 27.90,
    imagePath: "images/k2.webp",
    category: "Boy Kids",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "BLEACHED DESTROYED SOFT DENIM SHORTS",
    description:
        "SOFT DENIM SHORTS WITH ADJUSTABLE INTERIOR WAISTBAND AND FRONT BUTTON CLOSURE, SNAP",
    price: 27.90,
    imagePath: "images/k2.webp",
    category: "Boy Kids",
    color: "Multi-COlor",
  ),
];

var bagAndShoes = [
  ItemsFashion(
    name: "STUDDED LEATHER CLOGS",
    description:
        "LEATHER CLOG STYLE SHOES IN ECRU. LEATHER UPPER WITH STUDS AND TOPSTITCHING. SQUARED TOE.",
    price: 149.00,
    imagePath: "images/bs1.webp",
    category: "Woman",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "LOW HEEL FISHERMAN SANDALS",
    description:
        "FLAT CHUNKY SANDALS AVAILABLE IN MULTIPLE COLORS. FISHERMAN-STYLE UPPER. SIDE ADHESIVE STRAP",
    price: 49.90,
    imagePath: "images/bs2.webp",
    category: "Woman",
    color: "Multi-COlor",
  ),
];

var accessories = [
  ItemsFashion(
    name: "Round-frame sunglasses with crystals",
    description:
        "Presented for the Ouverture collection, the round sunglasses are imbued with a retro inspired feel. Encrusted with crystals and crafted from gold metal, the frame is complemented by violet lenses",
    price: 1230.0,
    imagePath: "images/acc1.jpg",
    category: "Woman",
    color: "Multi-COlor",
  ),
  ItemsFashion(
    name: "Geometrical-frame sunglasses",
    description:
        "An eclectic shape frame defines these sunglasses including a wavy temple. The lightweight feel of the gold metal gives these a warm weather feel.",
    price: 420.0,
    imagePath: "images/acc1.jpg",
    category: "Unisex",
    color: "Multi-COlor",
  ),
];
