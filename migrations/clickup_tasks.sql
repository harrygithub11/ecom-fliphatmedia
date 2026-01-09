-- ============================================
-- ClickUp-Style Task System: Database Migrations
-- Run this on your MySQL server (via phpMyAdmin or CLI)
-- ============================================

-- ============================================
-- PART 1: Core Task Table Enhancements
-- ============================================

-- 1.1 Add indexes for fast filtering
-- Note: If an index already exists, this will fail silently - that's OK
CREATE INDEX idx_tasks_assigned_to ON tasks(assigned_to);
CREATE INDEX idx_tasks_due_date ON tasks(due_date);
CREATE INDEX idx_tasks_status ON tasks(status);
CREATE INDEX idx_tasks_priority ON tasks(priority);
CREATE INDEX idx_tasks_customer ON tasks(customer_id);

-- 1.2 Soft delete support (ignore error if column exists)
ALTER TABLE tasks ADD COLUMN deleted_at DATETIME NULL;
ALTER TABLE tasks ADD COLUMN status_changed_by INT NULL;

-- ============================================
-- PART 2: Multiple Assignees Support
-- ============================================
CREATE TABLE IF NOT EXISTS task_assignees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT NOT NULL,
  user_id INT NOT NULL,
  assigned_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY unique_task_user (task_id, user_id),
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
);

-- ============================================
-- PART 3: Comments System
-- ============================================
CREATE TABLE IF NOT EXISTS task_comments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT NOT NULL,
  author_id INT NOT NULL,
  body TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  edited_at DATETIME NULL,
  INDEX idx_comments_task (task_id),
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
);

-- ============================================
-- PART 4: Attachments
-- ============================================
CREATE TABLE IF NOT EXISTS task_attachments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT NOT NULL,
  filename VARCHAR(255) NOT NULL,
  storage_path VARCHAR(512) NOT NULL,
  file_size INT DEFAULT 0,
  mime_type VARCHAR(128),
  uploaded_by INT,
  uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_attachments_task (task_id),
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
);

-- ============================================
-- PART 5: Audit Trail / History
-- ============================================
CREATE TABLE IF NOT EXISTS task_history (
  id INT AUTO_INCREMENT PRIMARY KEY,
  task_id INT NOT NULL,
  changed_by INT,
  change_type VARCHAR(64) NOT NULL,
  field_name VARCHAR(64),
  old_value TEXT,
  new_value TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_history_task (task_id),
  INDEX idx_history_type (change_type),
  FOREIGN KEY (task_id) REFERENCES tasks(id) ON DELETE CASCADE
);

-- ============================================
-- DONE! Migration complete.
-- ============================================
