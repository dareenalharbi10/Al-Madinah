<?php 
include 'includes/functions.php';
include 'includes/db.php';

$error = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    $confirm_password = $_POST['confirm_password'] ?? '';
    
    if (empty($username) || empty($email) || empty($password)) {
        $error = __('all_fields_required');
    } elseif (strlen($username) < 3) {
        $error = __('username_min_length');
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $error = __('invalid_email');
    } elseif ($password !== $confirm_password) {
        $error = __('passwords_do_not_match');
    } elseif (strlen($password) < 6) {
        $error = __('password_min_length');
    } else {
        try {
            $stmt = $pdo->prepare("SELECT user_id FROM users WHERE username = :username OR email = :email");
            $stmt->execute([':username' => $username, ':email' => $email]);
            
            if ($stmt->fetch()) {
                $error = __('username_or_email_exists');
            } else {
                $hashed_password = password_hash($password, PASSWORD_DEFAULT);
                $stmt = $pdo->prepare("INSERT INTO users (username, email, password_hash, role, created_at) 
                                       VALUES (:username, :email, :password_hash, 'user', NOW())");
                $stmt->execute([
                    ':username' => $username,
                    ':email' => $email,
                    ':password_hash' => $hashed_password
                ]);
                
                $success = __('registration_success');
                $username = $email = '';
            }
        } catch (PDOException $e) {
            $error = __('registration_error');
        }
    }
}

include 'includes/header.php';
?>

<style>
.auth-container {
    max-width: 500px;
    margin: 50px auto;
    background: white;
    border-radius: 16px;
    box-shadow: 0 10px 40px rgba(0,0,0,0.1);
    overflow: hidden;
}
.auth-header {
    background: linear-gradient(135deg, #1a6b4a 0%, #0a3e2f 100%);
    color: white;
    padding: 30px;
    text-align: center;
}
.auth-header h1 { font-size: 28px; margin-bottom: 10px; }
.auth-header p { opacity: 0.9; font-size: 14px; }
.auth-form { padding: 30px; }
.form-group { margin-bottom: 20px; }
.form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #333; }
.form-group input {
    width: 100%;
    padding: 12px 15px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 8px;
    transition: border-color 0.3s;
}
.form-group input:focus { outline: none; border-color: #1a6b4a; }
.btn-auth {
    width: 100%;
    background: #1a6b4a;
    color: white;
    border: none;
    padding: 14px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 8px;
    cursor: pointer;
    transition: background 0.3s;
}
.btn-auth:hover { background: #0a3e2f; }
.auth-footer {
    text-align: center;
    padding: 20px 30px 30px;
    border-top: 1px solid #eee;
    color: #666;
}
.auth-footer a { color: #1a6b4a; text-decoration: none; font-weight: bold; }
.auth-footer a:hover { text-decoration: underline; }
.alert { padding: 12px 20px; border-radius: 8px; margin-bottom: 20px; }
.alert-error { background: #fee2e2; border: 1px solid #ef4444; color: #b91c1c; }
.alert-success { background: #d1fae5; border: 1px solid #10b981; color: #065f46; }
</style>

<div class="auth-container">
    <div class="auth-header">
        <h1><?php echo __('create_account'); ?></h1>
        <p><?php echo __('join_us'); ?></p>
    </div>
    <div class="auth-form">
        <?php if ($error): ?>
            <div class="alert alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        <?php if ($success): ?>
            <div class="alert alert-success">
                <?php echo $success; ?> 
                <a href="login.php" style="color: #065f46; font-weight: bold;"><?php echo __('login_now'); ?></a>
            </div>
        <?php endif; ?>
        <form method="POST" action="">
            <div class="form-group">
                <label><?php echo __('username'); ?> *</label>
                <input type="text" name="username" value="<?php echo htmlspecialchars($username ?? ''); ?>" required>
            </div>
            <div class="form-group">
                <label><?php echo __('email'); ?> *</label>
                <input type="email" name="email" value="<?php echo htmlspecialchars($email ?? ''); ?>" required>
            </div>
            <div class="form-group">
                <label><?php echo __('password'); ?> *</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label><?php echo __('confirm_password'); ?> *</label>
                <input type="password" name="confirm_password" required>
            </div>
            <button type="submit" class="btn-auth"><?php echo __('register_btn'); ?></button>
        </form>
    </div>
    <div class="auth-footer">
        <?php echo __('have_account'); ?> <a href="login.php"><?php echo __('login_here'); ?></a>
    </div>
</div>

<?php include 'includes/footer.php'; ?>