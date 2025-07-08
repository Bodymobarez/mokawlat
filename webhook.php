<?php
/**
 * GitHub Webhook Handler for cPanel
 * This file handles automatic deployment when GitHub repository is updated
 */

// Verify GitHub webhook secret (optional but recommended)
$secret = 'your_webhook_secret_here';
$payload = file_get_contents('php://input');
$signature = $_SERVER['HTTP_X_HUB_SIGNATURE'] ?? '';

if (!empty($secret) && !hash_equals('sha1=' . hash_hmac('sha1', $payload, $secret), $signature)) {
    http_response_code(403);
    exit('Forbidden');
}

// Parse the payload
$data = json_decode($payload, true);

// Check if it's a push to the master branch
if ($data['ref'] === 'refs/heads/master') {
    // Log the deployment
    error_log("GitHub webhook triggered deployment at " . date('Y-m-d H:i:s'));
    
    // Change to your application directory
    chdir('/home/username/public_html');
    
    // Pull latest changes from GitHub
    exec('git pull origin master 2>&1', $output, $return_var);
    
    if ($return_var === 0) {
        // Run deployment script
        exec('bash deploy.sh 2>&1', $deploy_output, $deploy_return);
        
        if ($deploy_return === 0) {
            http_response_code(200);
            echo 'Deployment successful';
        } else {
            http_response_code(500);
            echo 'Deployment failed: ' . implode("\n", $deploy_output);
        }
    } else {
        http_response_code(500);
        echo 'Git pull failed: ' . implode("\n", $output);
    }
} else {
    http_response_code(200);
    echo 'Not a master branch push, ignoring';
}
?>
