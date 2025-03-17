import 'dart:convert';

import 'package:web3modal_flutter/web3modal_flutter.dart';

final contractAddress =
    EthereumAddress.fromHex("0xE428CdC392c5689B28121D377dBD6195389FF9bA");

final deployedContract = DeployedContract(
  ContractAbi.fromJson(
    jsonEncode([
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "buyer",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "string",
            "name": "userId",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "pesticideName",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "dateOfPurchase",
            "type": "uint256"
          }
        ],
        "name": "PurchaseMade",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "buyer",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "string",
            "name": "userId",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "string",
            "name": "pesticideName",
            "type": "string"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "RefundIssued",
        "type": "event"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"},
          {
            "internalType": "string[]",
            "name": "_pesticideNames",
            "type": "string[]"
          },
          {"internalType": "uint256[]", "name": "_amounts", "type": "uint256[]"}
        ],
        "name": "buyPesticides",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"}
        ],
        "name": "clearPesticides",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "getAllPurchases",
        "outputs": [
          {
            "components": [
              {"internalType": "string", "name": "userId", "type": "string"},
              {
                "components": [
                  {"internalType": "string", "name": "name", "type": "string"},
                  {
                    "internalType": "uint256",
                    "name": "cost",
                    "type": "uint256"
                  },
                  {
                    "internalType": "uint256",
                    "name": "dateOfPurchase",
                    "type": "uint256"
                  }
                ],
                "internalType": "struct PesticidePurchases.Pesticide[]",
                "name": "pesticides",
                "type": "tuple[]"
              },
              {"internalType": "uint256", "name": "balance", "type": "uint256"}
            ],
            "internalType": "struct PesticidePurchases.PurchaseSummary[]",
            "name": "",
            "type": "tuple[]"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"}
        ],
        "name": "getAmountBought",
        "outputs": [
          {"internalType": "uint256", "name": "", "type": "uint256"}
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"}
        ],
        "name": "getPesticidesBought",
        "outputs": [
          {
            "components": [
              {"internalType": "string", "name": "name", "type": "string"},
              {"internalType": "uint256", "name": "cost", "type": "uint256"},
              {
                "internalType": "uint256",
                "name": "dateOfPurchase",
                "type": "uint256"
              }
            ],
            "internalType": "struct PesticidePurchases.Pesticide[]",
            "name": "",
            "type": "tuple[]"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {"internalType": "string", "name": "_userId", "type": "string"},
          {
            "internalType": "uint256",
            "name": "_pesticideIndex",
            "type": "uint256"
          }
        ],
        "name": "refundPesticide",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "withdraw",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      }
    ]),
    "PesticidePurchases",
  ),
  contractAddress,
);
