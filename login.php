<?php 
include 'includes/functions.php';
include 'includes/db.php';

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email'] ?? '');
    $password = $_POST['password'] ?? '';
    
    if (empty($email) || empty($password)) {
        $error = __('all_fields_required');
    } else {
        try {
            $stmt = $pdo->prepare("SELECT user_id, username, email, password_hash, role FROM users WHERE email = :email");
            $stmt->execute([':email' => $email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            
            if ($user && password_verify($password, $user['password_hash'])) {
                $_SESSION['user_id'] = $user['user_id'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['email'] = $user['email'];
                $_SESSION['role'] = $user['role'];
                
                if ($user['role'] === 'admin') {
                    header('Location: admin/index.php');
                } else {
                    header('Location: index.php');
                }
                exit;
            } else {
                $error = __('invalid_credentials');
            }
        } catch (PDOException $e) {
            $error = __('login_error');
        }
    }
}

include 'includes/header.php';
?>

<style>
.auth-container {
    max-width: 450px;
    margin: 60px auto;
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
.form-group { margin-bottom: 25px; }
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
.alert-error {
    background: #fee2e2;
    border: 1px solid #ef4444;
    color: #b91c1c;
    padding: 12px 20px;
    border-radius: 8px;
    margin-bottom: 20px;
}
.remember-me {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}
.remember-me input { width: auto; }
.remember-me label { margin: 0; font-weight: normal; }
</style>

<div class="auth-container">
    <div class="auth-header">
        <h1><?php echo __('welcome_back'); ?></h1>
        <p><?php echo __('login_to_account'); ?></p>
    </div>
    <div class="auth-form">
        <?php if ($error): ?>
            <div class="alert-error"><?php echo $error; ?></div>
        <?php endif; ?>
        <form method="POST" action="">
            <div class="form-group">
                <label><?php echo __('email'); ?></label>
                <input type="email" name="email" value="<?php echo htmlspecialchars($email ?? ''); ?>" required autofocus>
            </div>
            <div class="form-group">
                <label><?php echo __('password'); ?></label>
                <input type="password" name="password" required>
            </div>
            <div class="remember-me">
                <input type="checkbox" name="remember_me" id="remember_me">
                <label for="remember_me"><?php echo __('remember_me'); ?></label>
            </div>
            <button type="submit" class="btn-auth"><?php echo __('login_btn'); ?></button>
        </form>
    </div>
    <div class="auth-footer">
        <?php echo __('dont_have_account'); ?> <a href="register.php"><?php echo __('create_one'); ?></a>
    </div>
</div>

<?php include 'includes/footer.php'; ?>