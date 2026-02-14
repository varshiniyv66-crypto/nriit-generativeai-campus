
// Mock of the server action logic using native fetch (Node 18+)
async function verifySheet(classId) {
    console.log(`Verifying class: ${classId}`);

    const sheetId = "1Zq6YLGyFQ35t-AAyGCm4FBBaOfRxxlVSyRl30wYHzBM"; // 2-2-CSE-B
    const url = `https://docs.google.com/spreadsheets/d/${sheetId}/export?format=csv`;

    console.log(`Fetching URL: ${url}`);

    try {
        const response = await fetch(url);
        console.log(`Response Status: ${response.status} ${response.statusText}`);

        if (!response.ok) {
            console.error("Failed to fetch sheet.");
            return;
        }

        const data = await response.text();
        console.log(`Fetched ${data.length} bytes.`);

        if (data.length > 0) {
            console.log("First 200 chars:");
            console.log(data.substring(0, 200));

            if (data.includes("Timestamp")) {
                console.log("✅ SUCCESS: CSV Content verified.");
            } else {
                console.warn("⚠️ WARNING: Content fetched but 'Timestamp' header missing. Check preview.");
            }
        } else {
            console.error("❌ ERROR: Empty response.");
        }

    } catch (error) {
        console.error("Fetch Error:", error);
    }
}

verifySheet("2-2-CSE-B");
