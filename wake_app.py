import sys
from playwright.sync_api import sync_playwright

# Replace with your actual Streamlit Community Cloud URL
APP_URL = "https://mlcrc-racing.streamlit.app"

def main():
    print(sys.version)
    with sync_playwright() as p:
        # Launch a headless Chromium browser
        browser = p.chromium.launch(headless=True)
        page = browser.new_page()
        
        print(f"Navigating to {APP_URL}...")
        page.goto(APP_URL, wait_until="networkidle")
        
        # Check if the "Wake up app" button is visible
        wake_button = page.get_by_role("button", name="Wake up app")
        
        if wake_button.is_visible():
            print("App is asleep! Clicking the 'Wake up app' button...")
            wake_button.click()
            # Wait for 15 seconds to ensure the app has time to spin up
            page.wait_for_timeout(15000)
            print("Wake up command sent successfully.")
        else:
            print("App is already awake and running.")
            
        browser.close()

if __name__ == "__main__":
    main()

