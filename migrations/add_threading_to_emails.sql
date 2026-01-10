
-- Migration: Add threading support to emails table (Cleanup)
-- Note: thread_id and in_reply_to already exist based on schema audit.
-- Adding missing index:
ALTER TABLE emails ADD INDEX idx_thread_id (thread_id);
