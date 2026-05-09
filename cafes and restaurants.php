<?php 
include 'includes/db.php';
include 'includes/header.php'; 

$category_id = 3; // Cafes
$places = [];
$error = null;

if (!isset($pdo) || $pdo === null) {
    $error = "Database connection failed. Please check your database configuration.";
} else {
    try {
        $places = get_places_by_category($pdo, $category_id);
        if ($places === false) {
            $error = "Failed to retrieve places from the database.";
            $places = [];
        }
    } catch (PDOException $e) {
        $error = "Database query error: " . $e->getMessage();
        $places = [];
    }
}

if ($error) {
    echo '<div style="
        background-color: #fee2e2;
        border: 1px solid #ef4444;
        color: #b91c1c;
        padding: 16px 20px;
        margin: 20px;
        border-radius: 8px;
        font-family: Arial, sans-serif;
        font-size: 15px;
    ">
        <strong>⚠️ Error:</strong> ' . htmlspecialchars($error) . '
    </div>';
    include 'includes/footer.php';
    exit;
}
?>

<style>
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
    transition: background 0.2s;
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
</style>

<div class="container">
    <h1><?php echo __('cafes'); ?></h1>
    <div class="grid">
        <?php foreach ($places as $index => $place): 

            // Collect only non-empty image paths
            $images = [];
            for ($i = 1; $i <= 6; $i++) {
                $col = 'image_path' . $i;
                if (!empty($place[$col])) {
                    $images[] = $place[$col];
                }
            }

            // Fallback if no images found
            if (empty($images)) {
                $images[] = 'assets/images/placeholder.jpg';
            }

            $totalImages = count($images);
            $viewerId = 'viewer_' . $index;
        ?>
            <div class="card">
                <div class="photo-viewer" id="<?php echo $viewerId; ?>">

                    <?php foreach ($images as $imgIndex => $imgPath): ?>
                        <img 
                            src="<?php echo htmlspecialchars($imgPath); ?>" 
                            alt="<?php echo htmlspecialchars($place['name_'.$lang]); ?>"
                            class="<?php echo $imgIndex === 0 ? 'active' : ''; ?>"
                        >
                    <?php endforeach; ?>

                    <?php if ($totalImages > 1): ?>
                        <button class="photo-nav prev" onclick="changePhoto('<?php echo $viewerId; ?>', -1)">&#10094;</button>
                        <button class="photo-nav next" onclick="changePhoto('<?php echo $viewerId; ?>', 1)">&#10095;</button>
                        <div class="photo-counter">
                            <span class="current-index">1</span> / <?php echo $totalImages; ?>
                        </div>
                    <?php endif; ?>

                </div>

                <div class="card-content">
                    <h3><?php echo $place['name_'.$lang]; ?></h3>
                    <p><?php echo $place['description_'.$lang]; ?></p>
                    <div class="card-links">
                        <a href="<?php echo $place['location_link']; ?>" target="_blank" class="btn"><?php echo __('location'); ?></a>
                        <?php if ($place['social_link']): ?>
                            <a href="<?php echo $place['social_link']; ?>" target="_blank" class="btn"><?php echo __('social'); ?></a>
                        <?php endif; ?>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>

<script>
function changePhoto(viewerId, direction) {
    const viewer = document.getElementById(viewerId);
    const images = viewer.querySelectorAll('img');
    const counter = viewer.querySelector('.current-index');
    const total = images.length;

    let activeIndex = 0;
    images.forEach((img, i) => {
        if (img.classList.contains('active')) activeIndex = i;
    });

    images[activeIndex].classList.remove('active');
    activeIndex = (activeIndex + direction + total) % total;
    images[activeIndex].classList.add('active');

    if (counter) counter.textContent = activeIndex + 1;
}
</script>

<?php include 'includes/footer.php'; ?>