-- Create table for dynamic stage configuration
CREATE TABLE IF NOT EXISTS lead_stages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    value VARCHAR(50) NOT NULL UNIQUE,
    label VARCHAR(100) NOT NULL,
    color VARCHAR(50) DEFAULT 'gray',
    display_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default stages
INSERT INTO lead_stages (value, label, color, display_order) VALUES
('new', 'New Lead', 'gray', 1),
('follow_up_required', 'Follow Up Req.', 'amber', 2),
('follow_up_done', 'Follow Up Done', 'blue', 3),
('qualified', 'Qualified', 'emerald', 4),
('contacted', 'Contacted', 'blue', 5),
('proposal_sent', 'Proposed', 'purple', 6),
('negotiation', 'Negotiating', 'orange', 7),
('won', 'Won 💰', 'green', 8),
('lost', 'Lost', 'gray', 9)
AS new_values
ON DUPLICATE KEY UPDATE 
    label = new_values.label, 
    color = new_values.color, 
    display_order = new_values.display_order;
