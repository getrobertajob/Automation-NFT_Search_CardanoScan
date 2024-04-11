# Automation-NFT_Search_CardanoScan
AutoHotKey script to cycle through the pages of minted NFTs on CardanoScan and search for specific NFT by name.
1) Configure variable at top of scirpt named "VarNFT" with the NFT name for search
2) Navigate to https://cardanoscan.io/
3) Search by NFT Policy ID
4) Click on View All link
5) Trigger script

  
-The script works by using the short key inputs in AutoHotKey to engage browser search feature.  
-Inputs the NFT name and enter key.  
-Moves cursor to the search field of browser where there is a visual indicator of results.  
-Then gets the color underneath the cursor.  
- Compares it to variable that stores the color when the result matches 1 result.  
-If result does not match than moves cursor to href for next page, clicks, and continues loop.  
-If result matches than outputs alert message with beep and breaks loop.  
