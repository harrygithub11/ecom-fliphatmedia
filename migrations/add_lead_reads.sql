CREATE TABLE IF NOT EXISTS lead_reads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    admin_id INT NOT NULL,
    lead_id INT NOT NULL,
    last_read_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY unique_read (admin_id, lead_id),
    FOREIGN KEY (admin_id) REFERENCES admins(id) ON DELETE CASCADE,
    FOREIGN KEY (lead_id) REFERENCES customers(id) ON DELETE CASCADE
);
