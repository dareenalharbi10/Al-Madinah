<?php 
include 'includes/functions.php';
include 'includes/header.php'; 
?>

<section class="hero">
    <h1><?php echo __('welcome'); ?></h1>
    <p><?php echo __('welcome_desc'); ?></p>
</section>

<div class="container">
    <div class="grid">
        <div class="card">
            <div class="card-content">
                <h3><?php echo __('religious'); ?></h3>
                <p><?php echo __('reli_desc'); ?></p>
                <a href="religious.php" class="btn"><?php echo __('View More'); ?></a>
            </div>
        </div>
        <div class="card">
            <div class="card-content">
                <h3><?php echo __('Cafes & Restaurants'); ?></h3>
                <p><?php echo __('cafe_desc'); ?></p>
                <a href="cafes and restaurants.php" class="btn"><?php echo __('View More'); ?></a>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>