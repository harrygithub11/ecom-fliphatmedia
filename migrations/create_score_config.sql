-- Create table for dynamic score configuration
CREATE TABLE IF NOT EXISTS lead_scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value VARCHAR(50) NOT NULL UNIQUE,
    label VARCHAR(100) NOT NULL,
    color VARCHAR(50) DEFAULT 'gray',
    emoji VARCHAR(10) DEFAULT '',
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default scores
INSERT INTO lead_scores (value, label, color, emoji, display_order) VALUES
('hot', 'HOT', 'red', '🔥', 1),
('warm', 'WARM', 'yellow', '🌤️', 2),
('cold', 'COLD', 'gray', '❄️', 3)
AS new_values
ON DUPLICATE KEY UPDATE 
    label = new_values.label, 
    color = new_values.color, 
    emoji = new_values.emoji, 
    display_order = new_values.display_order;
