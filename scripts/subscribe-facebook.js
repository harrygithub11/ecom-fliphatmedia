const mysql = require('mysql2/promise');
require('dotenv').config();

async function subscribeApp() {
    console.log('Connecting to database...');
    const connection = await mysql.createConnection(process.env.DATABASE_URL);

    try {
        // 1. Fetch access token from settings
        console.log('Fetching Facebook Page Access Token from settings...');
        const [rows] = await connection.execute(`
            SELECT \`value\` FROM system_settings WHERE \`key\` = 'facebook_access_token'
        `);

        if (rows.length === 0 || !rows[0].value) {
            throw new Error('No facebook_access_token found in system_settings table. Please save it in the Admin Dashboard first.');
        }

        const pageAccessToken = rows[0].value;
        const pageIdRow = await connection.execute(`SELECT \`value\` FROM system_settings WHERE \`key\` = 'facebook_page_id'`);
        const pageId = pageIdRow[0][0]?.value;

        console.log(`Found Access Token for Page ID: ${pageId}`);

        // 1.5 Verify Token
        console.log('Verifying Token Owner...');
        const verifyRes = await fetch(`https://graph.facebook.com/me?fields=id,name&access_token=${pageAccessToken}`);
        const verifyData = await verifyRes.json();

        if (verifyData.error) {
            throw new Error('Token is Invalid: ' + verifyData.error.message);
        }

        console.log(`Token belongs to: "${verifyData.name}" (ID: ${verifyData.id})`);

        if (verifyData.id !== pageId) {
            console.log('Detected User Token. Attempting to fetch Page Token automatically...');

            // 1. Fetch Accounts (Pages) using User Token
            const accountsRes = await fetch(`https://graph.facebook.com/me/accounts?access_token=${pageAccessToken}&limit=100`);
            const accountsData = await accountsRes.json();

            if (accountsData.error) {
                throw new Error('Failed to fetch pages: ' + accountsData.error.message);
            }

            // 2. Find the matching Page
            const matchingPage = accountsData.data.find(page => page.id === pageId);

            if (!matchingPage) {
                console.error('\n❌ CRITICAL ERROR: Page Not Found');
                console.error(`User "${verifyData.name}" does not seem to have admin access to Page ID: ${pageId}`);
                console.error('Available Pages:', accountsData.data.map(p => `${p.name} (${p.id})`).join(', '));
                return;
            }

            console.log(`✅ Found Page: "${matchingPage.name}"`);

            // 3. Swap the token
            pageAccessToken = matchingPage.access_token;
            console.log('✅ Automatically swapped User Token for Page Access Token.');
        } else {
            console.log('Token is already a Page Token.');
        }

        // 2. Call Graph API to subscribe
        console.log('Token matches Page ID! Subscribing App to Page (leadgen)...');
        const url = `https://graph.facebook.com/v18.0/${pageId}/subscribed_apps?subscribed_fields=leadgen&access_token=${pageAccessToken}`;

        const response = await fetch(url, { method: 'POST' });
        const data = await response.json();

        if (data.success) {
            console.log('✅ SUCCESS! The App is now explicitly subscribed to the Page.');
            console.log('You can now use the Lead Ads Testing Tool without the "No app associated" error.');
        } else {
            console.error('❌ FAILED to subscribe.');
            console.error('Facebook Response:', JSON.stringify(data, null, 2));
        }

    } catch (error) {
        console.error('Error:', error.message);
    } finally {
        await connection.end();
    }
}

subscribeApp();
