// SPDX-License-Identifier: MIT
// deployed https://sepolia.etherscan.io/address/0xE428CdC392c5689B28121D377dBD6195389FF9bA
pragma solidity ^0.8.0;

contract PesticidePurchases {
    struct Pesticide {
        string name;
        uint cost;
        uint dateOfPurchase; // Timestamp of the purchase
    }

    struct Purchase {
        address userAddress;
        Pesticide[] pesticides; // List of pesticides
    }

    struct PurchaseSummary {
        string userId;
        Pesticide[] pesticides;
        uint balance;
    }

    mapping(string => Purchase) private purchases;
    mapping(string => uint) private balances;
    string[] private userIds; // To keep track of all user IDs

    event PurchaseMade(
        address indexed buyer,
        string indexed userId,
        string pesticideName,
        uint amount,
        uint dateOfPurchase
    );
    event RefundIssued(
        address indexed buyer,
        string indexed userId,
        string pesticideName,
        uint amount
    );

    function buyPesticides(
        string memory _userId,
        string[] memory _pesticideNames,
        uint[] memory _amounts
    ) public payable {
        require(
            _pesticideNames.length == _amounts.length,
            "Pesticides and amounts arrays must have the same length"
        );

        uint totalAmount = 0;

        // Calculate the total cost
        for (uint i = 0; i < _amounts.length; i++) {
            totalAmount += _amounts[i];
        }

        require(msg.value == totalAmount, "Incorrect amount sent");

        // If it's the first purchase for this user, store the userId
        if (
            balances[_userId] == 0 &&
            purchases[_userId].userAddress == address(0)
        ) {
            userIds.push(_userId);
            purchases[_userId].userAddress = msg.sender; // Store user address
        }

        Purchase storage purchase = purchases[_userId];

        for (uint i = 0; i < _pesticideNames.length; i++) {
            purchase.pesticides.push(
                Pesticide(_pesticideNames[i], _amounts[i], block.timestamp)
            );
            balances[_userId] += _amounts[i];
            emit PurchaseMade(
                msg.sender,
                _userId,
                _pesticideNames[i],
                _amounts[i],
                block.timestamp
            );
        }
    }

    function refundPesticide(
        string memory _userId,
        uint _pesticideIndex
    ) public {
        Purchase storage purchase = purchases[_userId];
        Pesticide storage pesticide = purchase.pesticides[_pesticideIndex];
        balances[_userId] -= pesticide.cost;
        payable(msg.sender).transfer(pesticide.cost);
        emit RefundIssued(msg.sender, _userId, pesticide.name, pesticide.cost);
    }

    function getAmountBought(string memory _userId) public view returns (uint) {
        return balances[_userId];
    }

    function getPesticidesBought(
        string memory _userId
    ) public view returns (Pesticide[] memory) {
        Purchase storage purchase = purchases[_userId];
        return purchase.pesticides;
    }

    function getAllPurchases() public view returns (PurchaseSummary[] memory) {
        PurchaseSummary[] memory summaries = new PurchaseSummary[](
            userIds.length
        );

        for (uint i = 0; i < userIds.length; i++) {
            string memory userId = userIds[i];
            summaries[i] = PurchaseSummary(
                userId,
                purchases[userId].pesticides,
                balances[userId]
            );
        }

        return summaries;
    }

    function clearPesticides(string memory _userId) public {
        payable(purchases[_userId].userAddress).transfer(balances[_userId]);
        delete purchases[_userId];
        delete balances[_userId];

        // Remove userId from userIds array
        for (uint i = 0; i < userIds.length; i++) {
            if (
                keccak256(abi.encodePacked(userIds[i])) ==
                keccak256(abi.encodePacked(_userId))
            ) {
                userIds[i] = userIds[userIds.length - 1];
                userIds.pop();
                break;
            }
        }
    }

    function withdraw() public {
        for (uint i = 0; i < userIds.length; i++) {
            string memory userId = userIds[i];
            delete purchases[userId];
            delete balances[userId];
        }
        payable(msg.sender).transfer(address(this).balance);
    }
}
