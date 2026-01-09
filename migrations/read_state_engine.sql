-- ============================================
-- READ-STATE ENGINE: Database Migrations
-- Tracks who has seen what task/comment and implies unread state
-- ============================================

-- 1. TASK READS
-- Tracks the last time a user viewed a specific task
CREATE TABLE IF NOT EXISTS task_reads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    task_id INT NOT NULL,
    user_id INT NOT NULL,
    last_seen_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_task_read (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES admins(id) ON DELETE CASCADE
);

-- 2. COMMENT READS
-- Tracks which specific comments a user has seen
-- (Useful for "new comments since last visit")
CREATE TABLE IF NOT EXISTS comment_reads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    comment_id INT NOT NULL,
    user_id INT NOT NULL,
    seen_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_comment_read (comment_id, user_id),
    FOREIGN KEY (comment_id) REFERENCES task_comments(id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES admins(id) ON DELETE CASCADE
);

-- 3. NOTIFICATIONS
-- System-wide alerts for important events
CREATE TABLE IF NOT EXISTS notifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    type ENUM('task_assigned', 'comment_added', 'mention', 'task_status_change', 'due_date_approaching') NOT NULL,
    reference_id INT NOT NULL, -- ID of the task or comment depending on type
    related_entity_id INT NULL, -- Optional: ID of the parent task if reference_id is a comment
    is_read BOOLEAN DEFAULT FALSE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES admins(id) ON DELETE CASCADE
);

-- Indexes for performance
CREATE INDEX idx_notifications_user_unread ON notifications(user_id, is_read);
CREATE INDEX idx_task_reads_user ON task_reads(user_id);
