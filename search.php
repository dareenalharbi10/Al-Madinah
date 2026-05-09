<?php 
include 'includes/functions.php';
include 'includes/db.php';

$query = isset($_GET['q']) ? trim($_GET['q']) : '';
$category = isset($_GET['category']) ? trim($_GET['category']) : '';
$results = [];
$error = null;

if (!isset($pdo) || $pdo === null) {
    $error = "Database connection failed. Please check your database configuration.";
} else {
    if (!empty($query) || !empty($category)) {
        try {
            // Build the SQL query based on search parameters
            $sql = "SELECT p.*, c.name_en as category_name_en, c.name_ar as category_name_ar, c.name_ur as category_name_ur
                    FROM places p 
                    INNER JOIN categories c ON p.category_id = c.id 
                    WHERE 1=1";
            
            $params = [];
            
            if (!empty($query)) {
                $sql .= " AND (p.name_en LIKE :query1 
                         OR p.name_ar LIKE :query2 
                         OR p.name_ur LIKE :query3 
                         OR p.description_en LIKE :query4 
                         OR p.description_ar LIKE :query5
                         OR p.description_ur LIKE :query6)";
                
                $searchTerm = "%$query%";
                $params[':query1'] = $searchTerm;
                $params[':query2'] = $searchTerm;
                $params[':query3'] = $searchTerm;
                $params[':query4'] = $searchTerm;
                $params[':query5'] = $searchTerm;
                $params[':query6'] = $searchTerm;
            }
            
            if (!empty($category) && $category !== 'all') {
                $sql .= " AND c.name_en = :category";
                $params[':category'] = $category;
            }
            
            $stmt = $pdo->prepare($sql);
            foreach ($params as $key => $value) {
                $stmt->bindValue($key, $value);
            }
            $stmt->execute();
            $results = $stmt->fetchAll(PDO::FETCH_ASSOC);
            
        } catch (PDOException $e) {
            $error = "Database query error: " . $e->getMessage();
            $results = [];
        }
    }
}

// Get categories for filter dropdown
$categories = [];
try {
    $stmt = $pdo->query("SELECT * FROM categories ORDER BY id");
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    // Categories not critical
}
?>

<style>
.search-header {
    background: linear-gradient(135deg, #1a6b4a 0%, #0a3e2f 100%);
    color: white;
    padding: 40px 0;
    text-align: center;
    margin-bottom: 40px;
}

.search-header h1 {
    font-size: 32px;
    margin-bottom: 20px;
}

.search-form {
    max-width: 600px;
    margin: 0 auto;
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    justify-content: center;
}

.search-input {
    flex: 1;
    min-width: 250px;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 30px;
    outline: none;
    background: white;
}

.search-btn {
    background: #ffd700;
    color: #0a3e2f;
    border: none;
    padding: 12px 30px;
    font-size: 16px;
    border-radius: 30px;
    cursor: pointer;
    font-weight: bold;
    transition: background 0.3s;
}

.search-btn:hover {
    background: #ffed4a;
}

.filter-section {
    margin-bottom: 30px;
    text-align: center;
}

.filter-label {
    display: inline-block;
    margin-right: 15px;
    font-weight: bold;
}

.filter-select {
    padding: 8px 15px;
    font-size: 14px;
    border: 1px solid #ddd;
    border-radius: 20px;
    outline: none;
    cursor: pointer;
}

.results-count {
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 2px solid #eee;
    font-size: 16px;
    color: #666;
}

.no-results {
    text-align: center;
    padding: 60px 20px;
    background: #f9f9f9;
    border-radius: 16px;
}

.no-results h3 {
    font-size: 24px;
    color: #333;
    margin-bottom: 15px;
}

.no-results p {
    color: #666;
    margin-bottom: 25px;
}

.no-results .btn {
    display: inline-block;
}

.photo-viewer {
    position: relative;
    width: 100%;
    overflow: hidden;
    background: #000;
    border-radius: 8px 8px 0 0;
}

.photo-viewer img {
    width: 100%;
    height: 220px;
    object-fit: cover;
    display: none;
}

.photo-viewer img.active {
    display: block;
}

.photo-nav {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background: rgba(0,0,0,0.5);
    color: #fff;
    border: none;
    padding: 8px 12px;
    cursor: pointer;
    font-size: 18px;
    border-radius: 4px;
    z-index: 10;
    font-weight: bold;
}

.photo-nav:hover {
    background: rgba(0,0,0,0.8);
}

.photo-nav.prev { left: 8px; }
.photo-nav.next { right: 8px; }

.photo-counter {
    position: absolute;
    bottom: 8px;
    right: 10px;
    background: rgba(0,0,0,0.5);
    color: #fff;
    font-size: 12px;
    padding: 2px 8px;
    border-radius: 10px;
}

.card-links {
    display: flex;
    gap: 10px;
    margin-top: 15px;
    flex-wrap: wrap;
}

.btn-sm {
    padding: 6px 12px;
    font-size: 12px;
}

.category-badge {
    display: inline-block;
    background: #e9ecef;
    color: #495057;
    font-size: 11px;
    padding: 3px 10px;
    border-radius: 20px;
    margin-bottom: 10px;
}
</style>

<div class="search-header">
    <div class="container">
        <h1><?php echo __('search_results'); ?></h1>
        <form method="GET" action="search.php" class="search-form">
            <input type="text" name="q" class="search-input" placeholder="<?php echo __('search_placeholder'); ?>" value="<?php echo htmlspecialchars($query); ?>">
            <button type="submit" class="search-btn"><?php echo __('search_btn'); ?></button>
        </form>
    </div>
</div>

<div class="container">
    <div class="filter-section">
        <span class="filter-label"><?php echo __('filter_by_category'); ?>:</span>
        <select class="filter-select" id="categoryFilter" onchange="filterByCategory()">
            <option value="all"><?php echo __('all_categories'); ?></option>
            <?php foreach ($categories as $cat): ?>
                <option value="<?php echo $cat['name_en']; ?>" <?php echo ($category == $cat['name_en']) ? 'selected' : ''; ?>>
                    <?php echo $cat['name_' . $lang]; ?>
                </option>
            <?php endforeach; ?>
        </select>
    </div>

    <?php if (!empty($query) || !empty($category)): ?>
        <div class="results-count">
            <?php echo sprintf(__('found_results'), count($results)); ?> <?php echo __('for'); ?> 
            <strong>"<?php echo htmlspecialchars($query ?: __('all')); ?>"</strong>
        </div>
    <?php endif; ?>

    <?php if ($error): ?>
        <div style="background: #fee2e2; border: 1px solid #ef4444; color: #b91c1c; padding: 16px; margin: 20px 0; border-radius: 8px;">
            <strong>⚠️ Error:</strong> <?php echo htmlspecialchars($error); ?>
        </div>
    <?php elseif (empty($results) && (!empty($query) || !empty($category))): ?>
        <div class="no-results">
            <h3><?php echo __('no_results_found'); ?></h3>
            <p><?php echo __('no_results_suggestion'); ?></p>
            <a href="index.php" class="btn"><?php echo __('back_to_home'); ?></a>
        </div>
    <?php elseif (empty($results)): ?>
        <div class="no-results">
            <h3><?php echo __('enter_search_term'); ?></h3>
            <p><?php echo __('search_suggestion'); ?></p>
        </div>
    <?php else: ?>
        <div class="grid">
            <?php foreach ($results as $index => $place): 
                // جمع الصور من image_path1 إلى image_path6
                $images = [];
                for ($i = 1; $i <= 6; $i++) {
                    $col = 'image_path' . $i;
                    if (!empty($place[$col])) {
                        $images[] = $place[$col];
                    }
                }
                if (empty($images)) {
                    $images[] = 'assets/images/placeholder.jpg';
                }
                $totalImages = count($images);
                $viewerId = 'viewer_' . $index;
            ?>
                <div class="card">
                    <div class="photo-viewer" id="<?php echo $viewerId; ?>">
                        <?php foreach ($images as $imgIndex => $imgPath): ?>
                            <img src="<?php echo htmlspecialchars($imgPath); ?>" 
                                 alt="<?php echo htmlspecialchars($place['name_'.$lang]); ?>"
                                 class="<?php echo $imgIndex === 0 ? 'active' : ''; ?>">
                        <?php endforeach; ?>
                        <?php if ($totalImages > 1): ?>
                            <button class="photo-nav prev" onclick="changePhoto('<?php echo $viewerId; ?>', -1)">&#10094;</button>
                            <button class="photo-nav next" onclick="changePhoto('<?php echo $viewerId; ?>', 1)">&#10095;</button>
                            <div class="photo-counter"><span class="current-index">1</span> / <?php echo $totalImages; ?></div>
                        <?php endif; ?>
                    </div>
                    <div class="card-content">
                        <div class="category-badge"><?php echo $place['category_name_' . $lang]; ?></div>
                        <h3><?php echo htmlspecialchars($place['name_'.$lang]); ?></h3>
                        <p><?php echo htmlspecialchars(mb_substr($place['description_'.$lang], 0, 100) . '...'); ?></p>
                        <div class="card-links">
                            <a href="place_details.php?id=<?php echo $place['id']; ?>" class="btn btn-sm"><?php echo __('view_details'); ?></a>
                            <a href="<?php echo htmlspecialchars($place['location_link']); ?>" target="_blank" class="btn btn-sm"><?php echo __('location'); ?></a>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>

<script>
function changePhoto(viewerId, direction) {
    const viewer = document.getElementById(viewerId);
    const images = viewer.querySelectorAll('img');
    const counter = viewer.querySelector('.current-index');
    const total = images.length;
    
    if (total === 0) return;
    
    let activeIndex = 0;
    images.forEach((img, i) => {
        if (img.classList.contains('active')) activeIndex = i;
    });
    
    images[activeIndex].classList.remove('active');
    activeIndex = (activeIndex + direction + total) % total;
    images[activeIndex].classList.add('active');
    
    if (counter) counter.textContent = activeIndex + 1;
}

function filterByCategory() {
    const category = document.getElementById('categoryFilter').value;
    const query = document.querySelector('input[name="q"]').value;
    window.location.href = 'search.php?q=' + encodeURIComponent(query) + '&category=' + encodeURIComponent(category);
}
</script>

<?php include 'includes/footer.php'; ?>