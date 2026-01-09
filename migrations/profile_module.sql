-- Profile Module Migration

-- 1. Alter admins table to add profile fields
ALTER TABLE admins
ADD COLUMN phone VARCHAR(20) NULL,
ADD COLUMN avatar_url VARCHAR(500) NULL,
ADD COLUMN timezone VARCHAR(50) DEFAULT 'UTC',
ADD COLUMN language VARCHAR(10) DEFAULT 'en';

-- 2. Create admin_sessions table for security management
CREATE TABLE IF NOT EXISTS admin_sessions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    token_hash VARCHAR(255) NOT NULL,
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
);

-- 3. Create admin_login_history for audit trail
CREATE TABLE IF NOT EXISTS admin_login_history (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT, -- Nullable if login failed with unknown user
    email_attempted VARCHAR(255),
    ip_address VARCHAR(45),
    user_agent VARCHAR(255),
    location VARCHAR(100),
    success BOOLEAN DEFAULT FALSE,
    failure_reason VARCHAR(255),
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Create admin_activity_log for action tracking
CREATE TABLE IF NOT EXISTS admin_activity_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    action_type VARCHAR(50) NOT NULL, -- e.g., 'update_profile', 'change_password', 'export_data'
    action_description TEXT,
    entity_type VARCHAR(50), -- e.g., 'order', 'customer'
    entity_id INT,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
);

-- 5. Create admin_preferences for user settings
CREATE TABLE IF NOT EXISTS admin_preferences (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL UNIQUE,
    theme ENUM('light', 'dark', 'system') DEFAULT 'system',
    notify_email BOOLEAN DEFAULT TRUE,
    notify_in_app BOOLEAN DEFAULT TRUE,
    default_view VARCHAR(50) DEFAULT 'dashboard',
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE
);
