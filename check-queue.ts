
import { Queue } from 'bullmq';
import Redis from 'ioredis';
import * as dotenv from 'dotenv';
import path from 'path';

dotenv.config({ path: path.resolve(__dirname, '.env') });

const connection = {
    host: process.env.REDIS_HOST || '127.0.0.1',
    port: parseInt(process.env.REDIS_PORT || '6379'),
    password: process.env.REDIS_PASSWORD
};

async function check() {
    console.log("Checking Email Queue Status...");
    console.log("Redis Config:", { ...connection, password: connection.password ? '***' : 'none' });

    const queue = new Queue('email-queue', { connection });

    try {
        const counts = await queue.getJobCounts();
        console.log("Job Counts:", counts);

        const waiting = await queue.getWaiting();
        console.log("\nWaiting Jobs:");
        waiting.forEach(j => {
            console.log(`- Job ${j.id}: Email ID ${j.data.emailId}`);
        });

        const active = await queue.getActive();
        console.log("\nActive Jobs:");
        active.forEach(j => {
            console.log(`- Job ${j.id}: Email ID ${j.data.emailId}`);
        });

        const failed = await queue.getFailed();
        console.log("\nFailed Jobs:");
        failed.forEach(j => {
            console.log(`- Job ${j.id}: ${j.failedReason}`);
        });

    } catch (e) {
        console.error("Queue Check Failed:", e);
    } finally {
        await queue.close();
        process.exit(0);
    }
}

check();
