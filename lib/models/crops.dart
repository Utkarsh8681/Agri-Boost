// ignore_for_file: public_member_api_docs, sort_constructors_first
class Crop {
  final String id;
  final String name;
  final String imageUrl;
  final String description;

  Crop({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
  });
}

final List<Crop> crops = [
  Crop(
    id: '1',
    name: 'Apple',
    imageUrl:
        'https://plantix.net/en/library/assets/custom/crop-images/apple.jpeg',
    description: '''
Apple cultivation is primarily done in cooler climates with well-drained soil.
Steps:
1. Choose a location with full sunlight and good air circulation.
2. Prepare the soil with compost and organic matter.
3. Plant grafted saplings during the dormant season.
4. Prune the trees annually to maintain shape and productivity.
5. Monitor for pests and apply organic treatments if necessary.
    ''',
  ),
  Crop(
    id: '2',
    name: 'Banana',
    imageUrl:
        'https://www.asiafarming.com/wp-content/uploads/2015/10/Banana-Farming.jpg',
    description: '''
Banana is a tropical fruit requiring warm temperatures and high humidity.
Steps:
1. Select suckers or tissue culture plants for propagation.
2. Plant in rich, well-drained soil with good organic content.
3. Ensure regular irrigation, especially during dry periods.
4. Add fertilizers rich in potassium for better fruiting.
5. Provide support to avoid plant lodging.
    ''',
  ),
  Crop(
    id: '3',
    name: 'Blackgram',
    imageUrl:
        'http://dc-cdn.s3-ap-southeast-1.amazonaws.com/dc-Cover-20160118023442.Medi.png',
    description: '''
Blackgram is a pulse crop grown mostly in loamy soils.
Steps:
1. Sow seeds at the beginning of the rainy season.
2. Maintain row spacing for proper air circulation.
3. Apply nitrogen and phosphorus fertilizers in moderate amounts.
4. Monitor weed growth and perform timely weeding.
5. Harvest when pods turn black and mature.
    ''',
  ),
  Crop(
    id: '4',
    name: 'ChickPea',
    imageUrl:
        'https://storage.googleapis.com/cgiarorg/2020/07/f6257e07-new-chickpea-varieties.jpg',
    description: '''
Chickpeas thrive in cool, dry climates and well-drained soil.
Steps:
1. Prepare soil by plowing and removing clods.
2. Sow seeds during early winter with proper spacing.
3. Apply phosphorus fertilizers at sowing time.
4. Monitor for pod borer pests and apply biopesticides.
5. Harvest when leaves dry and pods mature.
    ''',
  ),
  Crop(
    id: '5',
    name: 'Coconut',
    imageUrl:
        'https://coconutseller.in/wp-content/uploads/2021/06/Coconut-cultivation.jpg',
    description: '''
Coconut palms require humid, coastal climates and sandy loam soil.
Steps:
1. Select hybrid or tall varieties suited to the region.
2. Dig pits and fill with organic manure and soil.
3. Transplant seedlings during the monsoon.
4. Irrigate regularly, especially in summer.
5. Apply fertilizers and mulch the base to retain moisture.
    ''',
  ),
  Crop(
    id: '6',
    name: 'Coffee',
    imageUrl:
        'https://www.soils.org/files/images/news/indalecio-coffee-aranas-image-2-rl-800x600.jpg',
    description: '''
Coffee is grown in shaded, tropical highland areas with good rainfall.
Steps:
1. Choose Arabica or Robusta depending on altitude.
2. Grow in well-drained, acidic soil.
3. Provide shade trees for optimal microclimate.
4. Prune and train plants regularly for better yield.
5. Harvest ripe red cherries and dry for processing.
    ''',
  ),
  Crop(
    id: '7',
    name: 'Cotton',
    imageUrl: 'https://c1.staticflickr.com/9/8197/8173772017_c9ca6da4ff_b.jpg',
    description: '''
Cotton is a cash crop grown in warm climates with moderate rainfall.
Steps:
1. Sow seeds in well-prepared, loamy soil.
2. Apply NPK fertilizers based on soil testing.
3. Control pests like bollworms using IPM techniques.
4. Ensure timely irrigation, especially during flowering.
5. Harvest when bolls open fully and are fluffy.
    ''',
  ),
  Crop(
    id: '8',
    name: 'Grapes',
    imageUrl:
        'https://i.pinimg.com/originals/d8/7a/94/d87a9415d252f87a0592870cf0db265a.jpg',
    description: '''
Grapes are grown in temperate zones with dry conditions during ripening.
Steps:
1. Prepare trellises for vine support.
2. Plant certified grape cuttings in sandy loam soil.
3. Prune annually to control growth and improve fruiting.
4. Fertilize with potassium-rich mixtures.
5. Protect from fungal diseases using preventive sprays.
    ''',
  ),
  Crop(
    id: '9',
    name: 'Jute',
    imageUrl:
        'https://as2.ftcdn.net/v2/jpg/03/09/09/89/1000_F_309098926_9nbiDQvEeVMyJZbxH7koU4RWFoC7v50v.jpg',
    description: '''
Jute is a fiber crop suited to hot, humid climates and alluvial soils.
Steps:
1. Prepare land by plowing and leveling.
2. Sow seeds before the onset of the monsoon.
3. Apply nitrogen and potassium fertilizers.
4. Perform weeding to avoid crop competition.
5. Harvest before seed setting and rett in water for fiber extraction.
    ''',
  ),
  Crop(
    id: '10',
    name: 'KidneyBeans',
    imageUrl:
        'https://www.crops.org/files/images/news/20160823-143936-hand-holding-kidney-beans-800x600.jpg',
    description: '''
Kidney beans require mild temperatures and fertile, well-drained soil.
Steps:
1. Plant in early spring after frost danger has passed.
2. Use crop rotation to prevent soil diseases.
3. Water regularly but avoid waterlogging.
4. Add compost and natural fertilizers for growth.
5. Harvest when pods dry and turn yellow.
    ''',
  ),
  Crop(
    id: '11',
    name: 'Lentil',
    imageUrl:
        'https://heartbeetfarms.com/wp-content/uploads/2021/01/lentil-harvest-scaled.jpg',
    description: '''
Lentils are grown in cool climates with well-drained loamy soil.
Steps:
1. Sow seeds in early winter or spring.
2. Ensure proper spacing for air circulation.
3. Apply phosphorus fertilizers during sowing.
4. Monitor for aphids and apply organic pesticides.
5. Harvest when pods turn yellow and dry.
    ''',
  ),
  Crop(
    id: '12',
    name: 'Maize',
    imageUrl:
        'https://www.365farmnet.com/wp-content/uploads/2020/05/Maisanbau-1.jpg',
    description: '''
Maize is a cereal crop grown in warm climates with moderate rainfall.
Steps:
1. Prepare soil with organic manure and plowing.
2. Sow seeds in rows with proper spacing.
3. Apply nitrogen-rich fertilizers during growth.
4. Irrigate regularly, especially during flowering.
5. Harvest when cobs are fully mature and dry.
    ''',
  ),
  Crop(
    id: '13',
    name: 'Mango',
    imageUrl:
        'https://pureecoindia.in/wp-content/uploads/2022/04/1-organic-mango-farm-for-sale-Pure-Eco-India111-750x400.jpg',
    description: '''
Mango trees thrive in tropical and subtropical climates.
Steps:
1. Plant grafted saplings in well-drained soil.
2. Ensure full sunlight and proper spacing.
3. Apply organic fertilizers during growth.
4. Prune trees to maintain shape and productivity.
5. Harvest when fruits are mature and firm.
    ''',
  ),
  Crop(
    id: '14',
    name: 'Watermelon',
    imageUrl:
        'https://www.haifa-group.com/sites/default/files/crop/sandias-caparros-premium1.jpg',
    description: '''
Watermelon is a warm-season crop grown in sandy loam soil.
Steps:
1. Sow seeds in raised beds with proper spacing.
2. Ensure regular irrigation during growth.
3. Apply potassium-rich fertilizers for better fruiting.
4. Monitor for pests and diseases.
5. Harvest when fruits are fully ripe and sound hollow when tapped.
    ''',
  ),
  Crop(
    id: '15',
    name: 'Papaya',
    imageUrl: 'https://i.ytimg.com/vi/dVqC4M_6EDg/maxresdefault.jpg',
    description: '''
Papaya is a tropical fruit that grows well in warm climates with well-drained soil.
Steps:
1. Select healthy seeds or seedlings for planting.
2. Prepare the soil with organic manure and compost.
3. Plant in rows with proper spacing for air circulation.
4. Water regularly but avoid waterlogging.
5. Harvest when fruits turn yellow and are slightly soft.
    ''',
  ),
  Crop(
    id: '16',
    name: 'MothBean',
    imageUrl:
        'https://cdn.permacultureplants.com/wp-content/uploads/plant2-scaled.jpg',
    description: '''
Moth beans are drought-resistant legumes grown in arid regions.
Steps:
1. Sow seeds in sandy or loamy soil during the monsoon season.
2. Ensure proper spacing for better growth.
3. Apply phosphorus fertilizers during sowing.
4. Monitor for pests and diseases and take preventive measures.
5. Harvest when pods are mature and dry.
    ''',
  ),
  Crop(
    id: '17',
    name: 'MungBean',
    imageUrl:
        'https://images.picxy.com/cache/2020/12/18/aa97624a3d68e8626349358b5a6d3519.jpg',
    description: '''
Mung beans are short-duration legumes grown in warm climates.
Steps:
1. Sow seeds in well-drained soil during the rainy season.
2. Apply organic fertilizers for better growth.
3. Ensure proper irrigation but avoid waterlogging.
4. Monitor for pests and diseases and take preventive measures.
5. Harvest when pods are mature and dry.
    ''',
  ),
  Crop(
    id: '18',
    name: 'Muskmelon',
    imageUrl: 'https://s3-eu-west-1.amazonaws.com/yara-links/lggw.jpg',
    description: '''
Muskmelon is a warm-season crop grown in sandy loam soil.
Steps:
1. Sow seeds in raised beds with proper spacing.
2. Ensure regular irrigation during growth.
3. Apply potassium-rich fertilizers for better fruiting.
4. Monitor for pests and diseases.
5. Harvest when fruits are fully ripe and sound hollow when tapped.
    ''',
  ),
  Crop(
    id: '19',
    name: 'Orange',
    imageUrl: 'https://i.ytimg.com/vi/FjjsSZBvx50/maxresdefault.jpg',
    description: '''
Orange trees thrive in subtropical climates with well-drained soil.
Steps:
1. Plant grafted saplings in well-prepared soil.
2. Ensure proper irrigation during dry periods.
3. Apply organic fertilizers and mulch the base.
4. Prune trees to maintain shape and productivity.
5. Harvest when fruits turn bright orange and are firm.
    ''',
  ),
  Crop(
    id: '20',
    name: 'PigeonPeas',
    imageUrl:
        "https://image.shutterstock.com/image-photo/pigeon-pea-crop-fieldpigeon-tuvar-260nw-1659042862.jpg",
    description: '''
Pigeon peas are drought-resistant legumes grown in tropical climates.
Steps:
1. Sow seeds in well-drained soil at the onset of the monsoon.
2. Apply phosphorus fertilizers during sowing.
3. Ensure proper spacing for air circulation.
4. Monitor for pests and diseases and take preventive measures.
5. Harvest when pods are mature and dry.
    ''',
  ),
  Crop(
    id: '21',
    name: 'Pomegranate',
    imageUrl:
        'https://www.thespruce.com/thmb/dOdDRctgABMGZWoasS3GyHIDByY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/pomegranate-growing-tips-3269232-04-486bb88091ad445b98bfd08ca2e2ebd1.jpg',
    description: '''
Pomegranate trees grow well in arid and semi-arid climates with loamy soil.
Steps:
1. Plant saplings in well-drained soil with proper spacing.
2. Apply organic fertilizers during the growing season.
3. Ensure regular irrigation but avoid waterlogging.
4. Prune trees to maintain shape and productivity.
5. Harvest when fruits turn red and are firm to touch.
    ''',
  ),
  Crop(
    id: '22',
    name: 'Rice',
    imageUrl: 'https://eos.com/wp-content/uploads/2023/04/rice-field.jpg',
    description: '''
Rice is a staple crop grown in warm, humid climates with waterlogged soil.
Steps:
1. Prepare the field by plowing and leveling.
2. Sow seeds in a nursery or directly in the field.
3. Transplant seedlings into flooded fields after 20-30 days.
4. Apply nitrogen-rich fertilizers during growth stages.
5. Ensure consistent water supply and weed control.
6. Harvest when grains turn golden and mature.
    ''',
  ),
];
